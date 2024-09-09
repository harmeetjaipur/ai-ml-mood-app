import { OpenAI } from '@langchain/openai'
import { StructuredOutputParser } from 'langchain/output_parsers'
import { PromptTemplate } from '@langchain/core/prompts'
import z from 'zod'

const parser = StructuredOutputParser.fromZodSchema(
  z.object({
    mood: z
      .string()
      .describe('the mood of the person who wrote the journal entry.'),
    subject: z.string().describe('the subject of the journal entry.'),
    negative: z
      .boolean()
      .describe(
        'is the journal entry negative? (i.e. does it contain negative emotions?)'
      ),
    summary: z.string().describe('quick summary of the entire entry.'),
    color: z
      .string()
      .describe(
        'a hexadecimal color code that represents the mood of the entry. Example #0101fe for blue.'
      ),
    // sentiment: z
    //   .string()
    //   .describe(
    //     'sentiment of the text and rated on a scale from -10 to 10 where -10 is extremely negative.'
    //   ),
  })
)

const getPrompt = async (content) => {
  const format_instructions = parser.getFormatInstructions()
  const prompt = new PromptTemplate({
    template:
      'Analyze the following journal entry. Follow the instructions and format your response to match the format instructions, no matter what! \n {format_instructions}\n{entry}',
    inputVariables: ['entry'],
    partialVariables: { format_instructions },
  })

  const input = await prompt.format({
    entry: content,
  })
  return input
}

const analyze = async (content: string) => {
  const input = await getPrompt(content)
  const model = new OpenAI({ temperature: 0, model: 'gpt-3.5-turbo' })
  const result = await model.invoke(input)

  try {
    return parser.parse(result)
  } catch (err) {
    console.log(err)
  }
}

export default analyze
