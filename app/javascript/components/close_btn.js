const closeEvent = () => {
  const closeBtn =  document.querySelector('.close-btn');
  const closeInput =  document.querySelector('.close-input');
  const closeForm = document.querySelector('.close-form');
  if (closeBtn) {
    closeBtn.addEventListener('click', (event) => {
      event.currentTarget.classList.remove("btn-warning")
      event.currentTarget.classList.add("btn-disabled")
      event.currentTarget.classList.remove("close-btn")
      event.currentTarget.classList.add("open-btn")
      event.currentTarget.innerText = "RIAPRI ISCRIZIONI"
      closeInput.value = true
      closeForm.submit()
    })
  }
}

const openEvent = () => {
  const openBtn =  document.querySelector('.open-btn');
  const closeInput =  document.querySelector('.close-input');
  const closeForm = document.querySelector('.close-form');
  if (openBtn) {
    openBtn.addEventListener('click', (event) => {
      event.currentTarget.classList.remove("btn-disabled")
      event.currentTarget.classList.add("btn-warning")
      event.currentTarget.classList.remove("open-btn")
      event.currentTarget.classList.add("close-btn")
      event.currentTarget.innerText = "CHIUDI ISCRIZIONI"
      closeInput.value = false
      closeForm.submit()
    })
  }
}

export { closeEvent, openEvent };
