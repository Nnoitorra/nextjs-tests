import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

async function main() {
    await prisma.activity.create({
        data: {
            kurz: 'tst',
            activity_de: 'test',
            activity_en: 'test',
            activity_es: 'test',
            activity_fr: 'tëst',
            activity_HU: 'tost',
            activity_it: 'tist',
            activity_pl: 'tast'
        }
    })
    const allActivities = await prisma.activity.findMany()
    console.log(allActivities)
}

export default function Page() {
    main()
        .then(async () => {
            await prisma.$disconnect()
        })
        .catch(async (e) => {
            console.error(e)
            await prisma.$disconnect
            process.exit(1)
        })
    return <p>TestPage</p>;
}