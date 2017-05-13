## Introduction ##
The script for run_analysis.R performs the following five steps:
        1. All the datasets are read in
        2. We then take only the STD and mean columns from             the whole dataset
        3. We then merge the datasets together with the                correct labels.
        4. Took our combinedData and converted it to                 factors
        5. Using dcast(), we then took the mean of the               data and printed it to a new file called                  'tidy.txt'

## Variables ##
        * xTrain, yTrain, xTest, yTest, subjectTrain, subjectTest contain our data.
        * desiredFeatures and desiredFeatures.names contain the STD and Mean data with 'STD' and 'Mean' as column names
        * test and train contain the cbound datasets
        * combinedData merges test and train with correct column names
        * combinedDataMelted is the melted data set
        * combinedDataMean is the mean of the melted dataset
        
## Output ##
tidy.txt with mean of our relevant activities