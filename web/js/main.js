
// back to top
window.onscroll = function () {
    scrollFunction()
};
function scrollFunction() {

    if (document.body.scrollTop > 600 || document.documentElement.scrollTop > 600) {
        document.getElementById("backtotopBtn").style.display = "block";
    } else {
        document.getElementById("backtotopBtn").style.display = "none";
    }
}

document.getElementById('backtotopBtn').addEventListener("click", function () {
    document.body.scrollTop = 0;
    document.documentElement.scrollTop = 0;
});

// Loading screen
setTimeout(function () {
    const loadingScreen = document.getElementById("preloading");
    loadingScreen.style.opacity = "0";
    }, 300);

setTimeout(function () {
    const loadingScreen = document.getElementById("preloading");
    loadingScreen.style.display = "none";
}, 700);

