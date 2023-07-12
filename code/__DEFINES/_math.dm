/**
 * Get the turf that `A` resides in, regardless of any containers.
 *
 * Use in favor of `A.loc` or `src.loc` so that things work correctly when
 * stored inside an inventory, locker, or other container.
 */
#define get_turf(A) get_step(A, 0)

#define CARDINAL_DIRS list(1,2,4,8)
#define CARDINAL_ALL_DIRS list(1,2,4,5,6,8,9,10)

//some colors
#define COLOR_RED "#FF0000"
#define COLOR_GREEN "#00FF00"
#define COLOR_BLUE "#0000FF"
#define COLOR_CYAN "#00FFFF"
#define COLOR_PINK "#FF00FF"
#define COLOR_YELLOW "#FFFF00"
#define COLOR_ORANGE "#FF9900"
#define COLOR_WHITE "#FFFFFF"
#define COLOR_BLACK "#000000"
#define COLOR_OIL "#030303"

//Grass Colors
#define COLOR_G_ICE "#C7EDDE" //faded cyan
#define COLOR_G_DES "#FF7C1C" //bright orange
#define COLOR_G_JUNG "#64AA6E" //faded green

#define LEFT 1
#define RIGHT 2

#define CEILING(x, y) ( -round(-(x) / (y)) * (y) )

// round() acts like floor(x, 1) by default but can't handle other values
#define FLOOR(x, y) ( round((x) / (y)) * (y) )

// Real modulus that handles decimals
#define MODULUS(x, y) ( (x) - (y) * round((x) / (y)) )

// Returns true if val is from min to max, inclusive.
#define ISINRANGE(val, min, max) (min <= val && val <= max)

// Same as above, exclusive.
#define ISINRANGE_EX(val, min, max) (min < val && val < max)

// Will filter out extra rotations and negative rotations
// E.g: 540 becomes 180. -180 becomes 180.
#define SIMPLIFY_DEGREES(degrees) (MODULUS((degrees), 360))

/// Gets the sign of x, returns -1 if negative, 0 if 0, 1 if positive
#define SIGN(x) ( ((x) > 0) - ((x) < 0) )

/// Converts a probability/second chance to probability/delta_time chance
/// For example, if you want an event to happen with a 10% per second chance, but your proc only runs every 5 seconds, do `if(prob(100*DT_PROB_RATE(0.1, 5)))`
#define DT_PROB_RATE(prob_per_second, delta_time) (1 - (1 - (prob_per_second)) ** (delta_time))

/// Like DT_PROB_RATE but easier to use, simply put `if(DT_PROB(10, 5))`
#define DT_PROB(prob_per_second_percent, delta_time) (prob(100*DT_PROB_RATE((prob_per_second_percent)/100, (delta_time))))
