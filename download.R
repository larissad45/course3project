##Script: download.R
##This script downloads the compressed file with the data for the project and unzips it
##
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,"dataset.zip")
unzip("dataset.zip")