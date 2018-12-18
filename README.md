# HandWrittenFormulaCompetition

The main goal of this project is to recognize handwritten formula and compute the answers. It is fundamentally a supervised learning problem in that a training set of labelled images is provided. From the given a set of handwritten formula images, we write an algorithm to recognize these images and try to compute the correct answers.  

# Data
In the data training, there are 22 symbols, each symbol has 515 image samples.  
The testing is different. Not just exactly with the data training. But in form of formula.  
We need to do some detection and segmentation to get the symbols like the training data.  
There are 5 level data testing (formulas). Each level consists of 30 testing formula.   

Training Data :  
![Training Data](http://jankristanto.com/images/symbol.jpg)  
Testing Formula (Sample) :
![Testing Formula](http://jankristanto.com/images/formula.JPG)   

# Work Flow 
![Workflow](http://jankristanto.com/images/workflow.JPG)   

# Model 
![Model](http://jankristanto.com/images/model.JPG)   
Model accuracy regards to the training data : 99.02 %

# Detection 
..* Vertical & Horizontal Projection   
..* Component Connected Labeling 
![Vertical Projection](http://jankristanto.com/images/vertical%20projection.JPG)     
Vertical Projection Result :  
![Vertical Projection](http://jankristanto.com/images/vertical%20projection%20results.JPG)   

Vertical Projection + Horizontal Projection:  
![Vertical Horizontal Projection](http://jankristanto.com/images/horizontal%20projection.JPG)   

Continue with CCL (Component Connected Labeling) : 
![CCL](http://jankristanto.com/images/ccl.JPG)   

Formula Decomposition (Sample) :   
![Decomposition](http://jankristanto.com/images/decom_sample.JPG)  

# Model Training 
We use traditional NN & SVM to train and predict the symbols.   
Accuracy & Cross Entrophy on training data :  
![Training Accuracy](http://jankristanto.com/images/training.JPG)  

# Prediction 
We try NN, C-SVM and V-SVM on the prediction layer.   
Accuracy on Testing(Formula)  data : 
![Training Accuracy](http://jankristanto.com/images/accuracy.JPG)  

# Limitation 
1. The classifier sometimes miss classify 
2. Fail to segment(decompose) symbols properly.
3. Fail to interpret complicated formula.   
![limitation](http://jankristanto.com/images/limitation.JPG)  
