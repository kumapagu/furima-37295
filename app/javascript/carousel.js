window.addEventListener('load', function() {
  const mainImageArea = document.getElementById('main-image')
  if (!mainImageArea) return null

  const subImage1 = document.getElementById('image-0')
  const subImage2 = document.getElementById('image-1')
  const subImage3 = document.getElementById('image-2')
  const subImage4 = document.getElementById('image-3')
  const subImage5 = document.getElementById('image-4')

  const changeImage = (e) => {
    let mainImage = mainImageArea.getAttribute('src')
    let subImage = e.target.getAttribute('src')
    if (mainImage !== subImage) {
      mainImageArea.setAttribute('src', subImage)
    }
  }

  subImage1.addEventListener('click', changeImage)
  subImage2.addEventListener('click', changeImage)
  subImage3.addEventListener('click', changeImage)
  subImage4.addEventListener('click', changeImage)
  subImage5.addEventListener('click', changeImage)
})