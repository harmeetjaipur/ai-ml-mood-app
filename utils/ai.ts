import { OpenAI } from '@langchain/openai'

const analyze = async (prompt: string) => {
  const model = new OpenAI({ temperature: 0, model: 'gpt-3.5-turbo' })
  const result = await model.invoke(prompt)
  console.log(result)
}

export default analyze
