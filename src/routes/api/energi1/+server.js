import { PrismaClient } from '@prisma/client';

export async function POST({ request, cookies }) {
    const body = await request.json();
    console.log
    const prisma = new PrismaClient();
    for (var i= 0; i< body.length; i++)
        await prisma.energi1.create({
            data: {
                authorId: request.user.id, //Sat af server-hook'en
                content: body[i]
            }
        });
    
    return new Response('Created', { status: 201 });
}