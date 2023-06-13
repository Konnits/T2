import prisma from '../prismaClient.js'

const top_5_personajes_con_mas_fuerza = async (req, res) => {

    const personajes = await prisma.personajes.findMany({
        orderBy: {
            fuerza: 'desc'
        }
    })

    res.json(personajes.slice(0, 5))
}

const personaje_con_mas_karts = async (req, res) => {

    const personajes = await prisma.personajes.findMany({})

    const karts = await prisma.karts.findMany({})

    const personajes_con_karts = personajes.map(personaje => {
        return {
            ...personaje,
            karts: karts.filter(kart => kart.id_personaje === personaje.id)
        }
    })

    const personaje_con_mas_karts = personajes_con_karts.reduce((prev, current) => {
        return (prev.karts.length > current.karts.length) ? prev : current
    })

    res.json(personaje_con_mas_karts)
}

const cantidad_habitantes = async (req, res) => {

    const { id_reino } = req.params

    const reino = await prisma.reinos.findUnique({
        where: {
            id: parseInt(id_reino)
        }
    })

    if(!reino){
        res.status(404).json({error: 'Reino not found'})
        return
    }

    const personaje_reino = await prisma.personaje_habita_reino.findMany({
        where: {
            id_reino: parseInt(id_reino)
        }
    })

    res.json({
        reino: reino.nombre,
        cantidad_habitantes: personaje_reino.length
    })       
}

const gobernante = async (req, res) => {

    const { id_reino } = req.params

    if(!id_reino){
        const personajes = await prisma.personajes.findMany()
        const gobernantes = await prisma.personaje_habita_reino.findMany({
            where: {
                es_gobernante: true
            }
        })

        const personajes_gobernantes = personajes.filter(personaje => gobernantes.find(gobernante => gobernante.id_personaje === personaje.id))

        res.json(personajes_gobernantes)

    }else{

        if(isNaN(parseInt(id_reino))){
            res.status(400).json({error: 'Param id_reino must be a number'})
            return
        }

        const governantes = await prisma.personaje_habita_reino.findMany({
            where: {
                id_reino: parseInt(id_reino),
                es_gobernante: true
            }
        })

        console.log(governantes)

        const personajes = (await prisma.personajes.findMany({})).filter(personaje => governantes.find(gobernante => gobernante.id_personaje === personaje.id))

        res.json(personajes)
    }
}

export { top_5_personajes_con_mas_fuerza, personaje_con_mas_karts, cantidad_habitantes, gobernante }