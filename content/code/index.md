+++
title = "Code"
date = "2018-01-07"
sidemenu = "true"
description = "Tools and Projects"
+++

[Overview](#overview)<br/>
[iButton Data Organizer](#ibuttons)<br/>
[NetCDF Data Access](#netcdf)<br/>
[LAStools Wrapper Functions from R](#lastools)<br/>


## Overview

I primarily use [R](https://cran.r-project.org/) for scientific computing, but also dabble in [bash](https://www.gnu.org/software/bash/), and use [SQL](https://en.wikipedia.org/wiki/SQL) a fair bit for spatial stuff, working from [PostgreSQL](https://www.postgresql.org/)/[PostGIS](https://postgis.net/) databases.

I'll disclaim that I have limited formal training in coding, but have been really fortunate for opportunities to improve my skills through a few opportunities I'd encourage others to look into. First, in 2014 I attended a joint [NCEAS](https://www.nceas.ucsb.edu/)/[RENCI](http://renci.org/) Open Science for Synthesis session, focused in training early career scientists useful computing tools to allow for reproducible research. This was a 3-week intensive course that covered a lot, and got me comfortable using some valuable and common tools of the trade. I'd highly recommend this to others.

Also, during my Postdoc at the University of Tulsa, I was able to engage in the emerging [Software Carpentry](https://software-carpentry.org/) community at Oklahoma State University. Software Carpentry (and the sibling [Data Carpentry](http://www.datacarpentry.org/)) is dedicated to teaching researchers computing skills to be more efficient and conduct reproducible research. They offer courses in a variety of tools, including Git, R, Python, Bash, and SQL, among others. Furthermore, they have a strong emphasis on pedagogy, using tried and true principles with the learners. If you are new to coding and have an opportunity, I highly recommend workshops from the Carpentries.

Below I've listed a few things I've worked on, which I hope others might find useful. My code can largely be found on two GitHub accounts; [mltConsEcol](https://github.com/mltConsEcol) is set up more for collaboration and such, and [mtreg](https://github.com/mtreg/) is generally for smaller, one-off types of projects. 


## <a name="ibuttons"></a>iButton Data Organizer

[iButtons](https://www.maximintegrated.com/en/products/digital/ibutton.html) are temperature and/or humidity loggers commonly used in environmental monitoring. However, using the readily-available tools, synchronizing the timing of data collection across multiple iButtons is not necessarily easy, though it's necessary to line up timestamps for easy comparison and further analysis/processing.  Thus, as part of work from my Postdoc, I put together a bunch of R code to allow for easier processing. It's currently available as an [R package via GitHub](https://github.com/mltConsEcol/iButtonDataOrganizer). See the package page on GitHub for installation instructions.  I'm not currently using iButtons, so have not been further developing the package, but reach out with questions or post an issue via GitHub.

## <a name="netcdf"></a>NetCDF Data Access

Some of the datasets I use are distributed as NetCDF files, which can be complex, involving multiple strata of data (e.g., multiple depths in the ocean) and with many time points.  As of this writing, two main datasets I've worked with are the [NY Harbor Observation and Prediction System (NYHOPS)](http://hudson.dl.stevens-tech.edu/maritimeforecast/) and [TopoWx (TopoWeather)](http://www.scrimhub.org/resources/topowx/). Thus, you can find some code I've developed for accessing these data on [GitHub](https://github.com/mltConsEcol/misc_netCDF_access). 

*Note: this will likely not work on Windows due to lacking dependencies for the ncdf4 package. I tend to set up a Linux virtual machine via [VirtualBox](https://www.virtualbox.org) for this work.*

## <a name="lastools"></a>LAStools Wrapper Functions from R

In the past I've done some pre-processing of LiDAR data for the state of Oklahoma, and set up some R code to functionally script some things from R using a powerful software package, [LAStools](https://rapidlasso.com/lastools/). The code is simply set up as R functions within a [GitHub Repository](https://github.com/mltConsEcol/OK_LiDAR_Processing), largely to check, and organize metadata, and correct projection information. Realizing how prevalent LiDAR data has become, I'd be happy for others to use the code as-is, if helpful, or build off of it (and if you do, please reach out to me).

