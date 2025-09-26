import { preloadImages } from '../utils.js';

// Variable to store the Lenis smooth scrolling object
let lenis;

// Selecting DOM elements

const contentElements = [...document.querySelectorAll('.content--sticky')];
const totalContentElements = contentElements.length;

// Initializes Lenis for smooth scrolling with specific properties
const initSmoothScrolling = () => {
	// Instantiate the Lenis object with specified properties
	lenis = new Lenis({
		lerp: 0.2, // Lower values create a smoother scroll effect
		smoothWheel: true // Enables smooth scrolling for mouse wheel events
	});

	// Update ScrollTrigger each time the user scrolls
	lenis.on('scroll', () => ScrollTrigger.update());

	// Define a function to run at each animation frame
	const scrollFn = (time) => {
		lenis.raf(time); // Run Lenis' requestAnimationFrame method
		requestAnimationFrame(scrollFn); // Recursively call scrollFn on each frame
	};
	// Start the animation frame loop
	requestAnimationFrame(scrollFn);
};

// Function to handle scroll-triggered animations
const scroll = () => {

    contentElements.forEach((el, position) => {
        
		const isLast = position === totalContentElements-1;
		
        gsap.timeline({
            scrollTrigger: {
                trigger: el,
                start: isLast ? 'top top' : 'bottom top',
                end: '+=100%',
                scrub: true
            }
        })
        .to(el, {
			ease: 'none',
            yPercent: -100
        }, 0);

    });

};

// Initialization function
const init = () => {
    initSmoothScrolling(); // Initialize Lenis for smooth scrolling
    scroll(); // Apply scroll-triggered animations
};

// ===== MOBILE APARTMENT SLIDER FUNCTIONALITY =====

// Apartment Slider Class
class ApartmentSlider {
    constructor() {
        this.slider = document.getElementById('apartmentSlider');
        this.slides = document.querySelectorAll('.slider-slide');
        this.prevBtn = document.getElementById('prevSlide');
        this.nextBtn = document.getElementById('nextSlide');
        this.currentSlide = 0;
        this.totalSlides = this.slides.length;
        this.isAnimating = false;
        this.autoPlayInterval = null;
        this.autoPlayDelay = 4000; // 4 seconds
        this.imagesLoaded = new Set(); // Track loaded images
        
        if (this.slider) {
            this.init();
        }
    }
    
    init() {
        // Preload all slider images
        this.preloadImages();
        
        // Add event listeners with immediate visual feedback
        this.prevBtn?.addEventListener('click', (e) => {
            e.preventDefault();
            this.prevBtn.style.transform = 'scale(0.9)';
            setTimeout(() => {
                this.prevBtn.style.transform = 'scale(1)';
            }, 100);
            console.log('Previous button clicked - going left');
            this.prevSlide();
        });
        this.nextBtn?.addEventListener('click', (e) => {
            e.preventDefault();
            this.nextBtn.style.transform = 'scale(0.9)';
            setTimeout(() => {
                this.nextBtn.style.transform = 'scale(1)';
            }, 100);
            console.log('Next button clicked - going right');
            this.nextSlide();
        });
        
        // Add touch/swipe support
        this.addTouchSupport();
        
        // Start auto-play
        this.startAutoPlay();
        
        // Pause auto-play on hover
        this.slider.addEventListener('mouseenter', () => this.stopAutoPlay());
        this.slider.addEventListener('mouseleave', () => this.startAutoPlay());
    }
    
    // Preload all slider images to prevent delays
    preloadImages() {
        this.slides.forEach((slide, index) => {
            const img = slide.querySelector('.slider-img');
            if (img && img.src) {
                const imageLoader = new Image();
                imageLoader.onload = () => {
                    this.imagesLoaded.add(index);
                    console.log(`Image ${index + 1} preloaded successfully`);
                };
                imageLoader.onerror = () => {
                    console.warn(`Failed to preload image ${index + 1}: ${img.src}`);
                };
                imageLoader.src = img.src;
            }
        });
    }
    
    goToSlide(index, direction = 'next') {
        if (this.isAnimating || index === this.currentSlide) return;
        
        this.isAnimating = true;
        
        // Perform transition immediately - don't wait for image preloading
        this.performSlideTransition(index, direction);
        
        // Preload the target image in background (non-blocking)
        if (!this.imagesLoaded.has(index)) {
            const targetSlide = this.slides[index];
            const img = targetSlide.querySelector('.slider-img');
            if (img && img.src) {
                const imageLoader = new Image();
                imageLoader.onload = () => {
                    this.imagesLoaded.add(index);
                };
                imageLoader.onerror = () => {
                    console.warn(`Failed to load image for slide ${index + 1}`);
                };
                imageLoader.src = img.src;
            }
        }
    }
    
    performSlideTransition(index, direction) {
        // Remove active classes
        this.slides[this.currentSlide].classList.remove('active');
        
        // Add animation classes based on direction
        if (direction === 'next') {
            // Next: current slide goes out left, new slide comes in from right
            this.slides[this.currentSlide].classList.add('slide-out');
        } else {
            // Previous: current slide goes out right, new slide comes in from left
            this.slides[this.currentSlide].classList.add('slide-out-right');
        }
        
        // Update current slide
        this.currentSlide = index;
        
        // Add active classes to new slide
        this.slides[this.currentSlide].classList.add('active');
        
        // Add slide-in animation based on direction
        if (direction === 'next') {
            this.slides[this.currentSlide].classList.add('slide-in');
        } else {
            this.slides[this.currentSlide].classList.add('slide-in-left');
        }
        
        // Clean up animation classes with reduced delay
        setTimeout(() => {
            this.slides.forEach(slide => {
                slide.classList.remove('slide-in', 'slide-out', 'slide-in-left', 'slide-out-right');
            });
            this.isAnimating = false;
        }, 200); // Reduced from 300ms to 200ms for faster response
    }
    
    nextSlide() {
        const nextIndex = (this.currentSlide + 1) % this.totalSlides;
        this.goToSlide(nextIndex, 'next');
    }
    
    prevSlide() {
        const prevIndex = (this.currentSlide - 1 + this.totalSlides) % this.totalSlides;
        this.goToSlide(prevIndex, 'prev');
    }
    
    startAutoPlay() {
        this.stopAutoPlay();
        this.autoPlayInterval = setInterval(() => {
            this.nextSlide();
        }, this.autoPlayDelay);
    }
    
    stopAutoPlay() {
        if (this.autoPlayInterval) {
            clearInterval(this.autoPlayInterval);
            this.autoPlayInterval = null;
        }
    }
    
    addTouchSupport() {
        let startX = 0;
        let startY = 0;
        let endX = 0;
        let endY = 0;
        let isScrolling = false;
        
        this.slider.addEventListener('touchstart', (e) => {
            startX = e.touches[0].clientX;
            startY = e.touches[0].clientY;
            isScrolling = false;
        });
        
        this.slider.addEventListener('touchmove', (e) => {
            if (!startX || !startY) return;
            
            endX = e.touches[0].clientX;
            endY = e.touches[0].clientY;
            
            const diffX = startX - endX;
            const diffY = startY - endY;
            
            // Determine if it's a horizontal or vertical swipe
            if (Math.abs(diffX) > Math.abs(diffY)) {
                isScrolling = true;
                e.preventDefault(); // Prevent vertical scroll
            }
        });
        
        this.slider.addEventListener('touchend', (e) => {
            if (!startX || !startY || !isScrolling) return;
            
            const diffX = startX - endX;
            const threshold = 50; // Minimum swipe distance
            
            if (Math.abs(diffX) > threshold) {
                if (diffX > 0) {
                    // Swipe left - next slide
                    this.nextSlide();
                } else {
                    // Swipe right - previous slide
                    this.prevSlide();
                }
            }
            
            // Reset values
            startX = 0;
            startY = 0;
            endX = 0;
            endY = 0;
            isScrolling = false;
        });
    }
}

// Initialize apartment slider when DOM is loaded
document.addEventListener('DOMContentLoaded', () => {
    // Only initialize on mobile devices
    if (window.innerWidth <= 768) {
        new ApartmentSlider();
    }
    
    // Initialize Cards Slider
    initializeCardsSlider();
});

// Re-initialize on window resize
window.addEventListener('resize', () => {
    if (window.innerWidth <= 768) {
        // Re-initialize apartment slider if not already initialized
        if (!document.querySelector('.apartment-slider').sliderInstance) {
            new ApartmentSlider();
        }
    }
    
    // Re-initialize cards slider on all screen sizes
    if (!document.querySelector('.mySwiper').swiper) {
        initializeCardsSlider();
    }
});

// ===== CARDS SLIDER FUNCTIONALITY =====

function initializeCardsSlider() {
    // Check if Swiper is available
    if (typeof Swiper !== 'undefined') {
        const cardsSwiper = new Swiper('.mySwiper', {
            slidesPerView: 1,
            spaceBetween: 20,
            loop: true,
            autoplay: {
                delay: 3000,
                disableOnInteraction: false,
            },
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
            breakpoints: {
                320: {
                    slidesPerView: 3,
                    spaceBetween: 10,
                },
                480: {
                    slidesPerView: 3,
                    spaceBetween: 15,
                },
                768: {
                    slidesPerView: 3,
                    slidesPerGroup: 1,
                    spaceBetween: 0,
                },
            },
        });
        
        // Add hover effects to cards
        const cards = document.querySelectorAll('.SingleCard');
        cards.forEach(card => {
            card.addEventListener('mouseenter', function() {
                this.style.transform = 'translateY(-10px) scale(1.02)';
            });
            
            card.addEventListener('mouseleave', function() {
                this.style.transform = 'translateY(0) scale(1)';
            });
        });
        
        console.log('Cards Slider initialized successfully');
    } else {
        console.warn('Swiper library not loaded. Cards slider will not work.');
        
        // Fallback: Add basic click functionality
        addFallbackCardsFunctionality();
    }
}

// Fallback functionality if Swiper is not available
function addFallbackCardsFunctionality() {
    const cards = document.querySelectorAll('.SingleCard');
    
    cards.forEach(card => {
        card.addEventListener('click', function() {
            // Add click animation
            this.style.transform = 'scale(0.95)';
            setTimeout(() => {
                this.style.transform = 'scale(1)';
            }, 150);
            
            // You can add more functionality here
            console.log('Card clicked:', this.querySelector('.SingleCard_cardTitle').textContent);
        });
        
        // Add hover effects
        card.addEventListener('mouseenter', function() {
            this.style.transform = 'translateY(-5px)';
            this.style.boxShadow = '0 8px 25px rgba(0,0,0,0.15)';
        });
        
        card.addEventListener('mouseleave', function() {
            this.style.transform = 'translateY(0)';
            this.style.boxShadow = '0 4px 12px rgba(0,0,0,0.1)';
        });
    });
}

preloadImages('.content__img').then(() => {
    // Once images are preloaded, remove the 'loading' indicator/class from the body
    document.body.classList.remove('loading');
    init();
});