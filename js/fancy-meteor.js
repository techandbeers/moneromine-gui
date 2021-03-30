var meteor = document.getElementById('meteor-lottie')
var animation = bodymovin.loadAnimation({
  container: meteor,
  path: 'https://assets9.lottiefiles.com/packages/lf20_9e1els2y.json',
  animType:'svg',
  loop: false,
  autoplay: false,
  name: "moneromineMeteor",
})
meteor.style.opacity = 1
meteor.addEventListener('mouseover',runAnimation)

function runAnimation() {
  meteor.removeEventListener('mouseover',runAnimation)
  lottie.play('moneromineMeteor')
  setTimeout(() => {
    meteor.style.left = '-200px'
    meteor.style.transform = 'rotate(225deg) translateY(-400px)'
    setTimeout(() => {
      meteor.style.transition = 'all 0'
      meteor.style.opacity = 0
      lottie.goToAndStop(0)
      setTimeout(() => {
        meteor.style.left = null
        meteor.style.transform = null
        setTimeout(() => {
          meteor.style.transition = null
          meteor.style.opacity = 1
          setTimeout(() => {
            meteor.addEventListener('mouseover',runAnimation)
          },2000)
        }, 2000)
      }, 2000)
    }, 1500)
  }, 200)
}