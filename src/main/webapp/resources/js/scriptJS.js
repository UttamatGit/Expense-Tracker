// Wait for the page to load before executing animations
document.addEventListener("DOMContentLoaded", () => {
    const { motion } = window.framerMotion;

    // Animate the card on load
    motion.animate(".card", {
        opacity: [0, 1],
        y: [-20, 0]
    }, { duration: 1, ease: "easeOut" });

    // Button hover effect using Framer Motion
    const btn = document.querySelector(".btn");
    btn.addEventListener("mouseover", () => {
        motion.animate(".btn", { scale: 1.1 }, { duration: 0.2 });
    });
    btn.addEventListener("mouseleave", () => {
        motion.animate(".btn", { scale: 1 }, { duration: 0.2 });
    });

    // Input focus effect
    const inputs = document.querySelectorAll(".input-field");
    inputs.forEach(input => {
        input.addEventListener("focus", () => {
            motion.animate(input, { scale: 1.05 }, { duration: 0.2 });
        });
        input.addEventListener("blur", () => {
            motion.animate(input, { scale: 1 }, { duration: 0.2 });
        });
    });
});
