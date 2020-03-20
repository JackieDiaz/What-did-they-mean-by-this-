const quoteUrl = "http://localhost:3001/quotes/"
const speakerUrl = "http://localhost:3001/speakers/"

select = document.querySelector('select')


fetch(speakerUrl)
    .then(response => response.json())
    .then(speakers => {
        speakers.map(speaker => {

            const option = document.createElement('option')
            const h2 = document.createElement('h2')
            
            option.value = speaker.id
            option.innerText = speaker.name
            

            select.append(option)

            
        })
    })

