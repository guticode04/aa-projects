
const dogLinkCreator = (dogsObj) => {
  const links = []
  for( const dog in dogsObj) {
    const link = document.createElement("a")
    link.innerHTML = dog
    link.href = dogsObj[dog]
    
    const createLI = document.createElement("li")
    createLI.classList = 'dog-link'
    createLI.appendChild(link)
    
    links.push(createLI)
  }
  return links
}


const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};
const attachDogLinks = () => {
  const dropList = document.querySelector('.drop-down-dog-list')
  const dogLinks = dogLinkCreator(dogs)
  dogLinks.forEach( link => {
    dropList.appendChild(link)
  })
}
attachDogLinks()

const handleLeave = (event) => {
  const dogLinks = document.querySelectorAll('.dog-link')
  dogLinks.forEach( link => {
    link.classList.remove('show')
  })
}
const handleEnter = () => {
  const dogLinks = document.querySelectorAll('.dog-link')
  dogLinks.forEach( link => {
    link.classList.add('show')
  })
}
const nav = document.querySelector('.drop-down-dog-list')
nav.addEventListener('mouseenter', handleEnter)
nav.addEventListener('mouseleave', handleLeave) 

