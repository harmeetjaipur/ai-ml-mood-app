import Link from 'next/link'
import { auth } from '@clerk/nextjs/server'

export default async function Home() {
  const { userId } = await auth()
  const href = userId ? '/journal' : '/new-user'

  return (
    <div className="w-screen h-screen bg-black/95 flex justify-center items-center text-white">
      <div className="w-full max-w-[768px] mx-auto">
        <h1 className="text-6xl mb-4 text-teal-500">GreenWave</h1>
        <p className="text-2xl text-white/60 mb-4">
          This is the best app for environment cautious people.
        </p>
        <div>
          <Link href={href}>
            <button className="text-teal-500 rounded px-4 py-2 text-xl bg-white/90">
              get started
            </button>
          </Link>
        </div>
      </div>
    </div>
  )
}
