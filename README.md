Caching the Web
======================

The source code needed to reproduce the results in a paper about caching at the web browser.

The result pages are all taken from webpagetest.org. If you want to add more, manually run and download the main page of the results and then run fetch-more-data.bash to download the two additional result pages needed.

big-fat-script.bash is the main script which will result in a great list with all the results in them. render-data.bash and bandwidth-data.bash both calculate the averages for their respective data-type.
