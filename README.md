# Content-Aware-Scaling
Resizes images dynamically using seam carving

# Example:
# Input
![artorias](https://user-images.githubusercontent.com/15223179/41494322-8a112348-70c6-11e8-9465-0fe5995d5452.jpg)

# Output (50% Width Scaling)
![artorias_scaled](https://user-images.githubusercontent.com/15223179/41494327-94935b42-70c6-11e8-9088-2aaa7ffbc5a5.jpg)

# Procedure
Gradient magnitude:

![artorias_energy](https://user-images.githubusercontent.com/15223179/41494323-8cf6e430-70c6-11e8-9c5d-8930b9de640c.jpg)


Cumulative seam costs:

![artorias_dp](https://user-images.githubusercontent.com/15223179/41494324-8f6840a6-70c6-11e8-8cd1-bbc62ebcc2d7.jpg)


Minimum cost seams:

![artorias_seams](https://user-images.githubusercontent.com/15223179/41494325-91dc5520-70c6-11e8-8ebc-a6385b5f55d4.jpg)
