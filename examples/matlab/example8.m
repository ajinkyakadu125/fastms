function example3()
    in_image = imread('../../images/dog.png');

    out_image = fastms(in_image, 'engine', 0,'row1d',479,'lambda', 1, 'alpha', 10000,'stop_eps', 1e-7);

    show_images(in_image, out_image);    
end