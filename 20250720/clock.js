

let clock = document.getElementById("clock")

setInterval(() => {
  let date = new Date()
  let hours = date.getHours().toString().padStart(2, "0")
  let minutes = date.getMinutes().toString().padStart(2, "0")
  let seconds = date.getSeconds().toString().padStart(2, "0")
  clock.textContent = `${hours}:${minutes}:${seconds}`
}, 1000)

