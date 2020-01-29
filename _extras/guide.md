---
layout: page
title: "Instructor Notes"
---

{% include base_path.html %}

## Instructor notes

## Lesson motivation and learning objectives

This lesson is designed to introduce learners to the fundamental principles and skills for working with
raster and vector geospatial data in R. It begins by introducing the structure of and simple plotting of 
raster data. It then covers re-projection of raster data, performing raster math, and working with multi-band
raster data. After introducing raster data, the lesson moves into working with vector data. Line, point, and
polygon shapefiles are included in the data. Learners will plot multiple raster and/or vector layers
in a single plot, and learn how to customize plot elements such as legends and titles. They will 
also learn how to read data in from a csv formatted file and re-format it to a shapefile. Lastly, learners
will work with multi-layered raster data set representing time series data and extract summary statistics
from this data. 

## Lesson design

#### Overall comments

* As of initial release of this lesson (August 2018), the timing is set to be the same for each episode. This
is very likely incorrect and will need to be updated as these lessons are taught. If you teach this lesson, 
please put in an issue or PR to suggest an updating timing scheme!!

* The code examples presented in each episode assume that the learners still have all of the data and packages
loaded from all previous episodes in this lesson. If learners close out of their R session during the breaks or
at the end of the first day, they will need to either save the workspace or reload the data and packages. 
Because of this, it is essential that learners save their code to a script throughout the lesson.

#### [Intro to Raster Data in R]({{ relative_root_path }}/{% link _episodes/04-raster-structure.md %})

* Be sure to introduce the datasets that will be used in this lesson. There are many data files. It may
be helpful to draw a diagram on the board showing the types of data that will be plotted and analyzed 
throughout the lesson. 
* If the [Introduction to Geospatial Concepts](https://datacarpentry.org/organization-geospatial/) lesson was
included in your workshop, learners will have been introduced to the GDAL library. It will be useful to make 
the connection back to that lesson explicitly.
* If the [Introduction to R for Geospatial Data](https://datacarpentry.org/r-intro-geospatial/) lesson was included
in your workshop, learners will be familiar with the idea of packages and with most of the functions used
in this lesson.
* The Dealing with Missing Data and Bad Data Values in Rasters sections have several plots showing alternative ways of displaying missing
data. The code for generating these plots is **not** shared with the learners, as it relies on many functions
they have not yet learned. For these and other plots with hidden demonstration code, show the images in the 
lesson page while discussing those examples. 
* Be sure to draw a distinction between the DTM and the DSM files, as these two datasets will be used
throughout the lesson.

#### [Open and Plot Shapefiles in R]({{ relative_root_path }}/{% link _episodes/01-vector-open-shapefile-in-r.md %})

* Learners may have heard of the `sp` package. If it comes up, explain that `sf` is a
more modern update of `sp`. 
* There is a known bug in the `geom_sf()` function that leads to an intermittent error on some platforms. 
If you see the following error message, try to re-run your plotting command and it should work. 
The `ggplot` development team is working on fixing this bug.

## Error message
> ~~~
> Error in grid.Call(C_textBounds, as.graphicsAnnot(x$label), x$x, x$y,  : 
  polygon edge not found
> ~~~
> {: .error}

#### [Convert from .csv to a Shapefile in R]({{ relative_root_path }}/02-vector-csv-to-shapefile-in-r/)

* No notes yet. Please add your tips and comments!

#### Concluding remarks

* No notes yet. Please add your tips and comments! 

## Technical tips and tricks

* Leave about 30 minutes at the start of each workshop and another 15 mins
at the start of each session for technical difficulties like WiFi and
installing things (even if you asked students to install in advance, longer if
not).

* Don't worry about being correct or knowing the material back-to-front. Use
mistakes as teaching moments: the most vital skill you can impart is how to
debug and recover from unexpected errors.

## Common problems

TBA - Instructors please add situations you encounter here.

{% include links.md %}
