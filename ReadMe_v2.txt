===========================================================
Questions or Problems please email to 
Jan Kristanto (jan_kristanto@mail.ugm.ac.id)
0386032
ED422 NCTU
===========================================================
===========================================================
There are 3 models in here.
V-SVM
C-SVM
Neural Network
There are many things that could be running
****************************************
DEMO ALL DATA TESTING
1. Go to /code/
2. Open file demo_all.m
3. Run
**************************************** 
****************************************
Convert Training Data into Matrix 
1. Go to /code/
2. Open file convert2mat.m
3. Run
**************************************** 
****************************************
Convert Testing Data into Matrix 
1. Go to /code/
2. Open file formula2mat.m
3. Run
4. Go to step 2 and change the level 
5. Do step 4 for each level
5. Run merge_testing_data.m
**************************************** 
****************************************
Train the Model
1. Go to /code/
2. Open file training_phase.m
3. Run
**************************************** 
****************************************
Try Demo for each level
1. Go to /code/
2. Open file main_per_level.m
3. Choose/change your testing data
4. Run
**************************************** 
===========================================================
===========================================================
NOTE
1. I renamed the function svmtrain to libsvmtrain 
in order to avoid its conflict with 
the svmtrain function of the matlab. 
See https://www.csie.ntu.edu.tw/~cjlin/libsvm/faq.html#f806. 
I also renamed the svmpredict function.

2. I change the directories name and path of the training data. see the
build_notations.m and init.m for more details. 

3. If you have any problem to run this program, just simply drom me an email
===========================================================