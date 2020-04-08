# [Simple Linear Regression Using TensorFlow and Keras](https://www.machinelearningmindset.com/linear-regression-with-tensorflow/)

In this tutorial, we will introduce how to train and evaluate a *Linear Regression* model using [TensorFlow. ](https://www.tensorflow.org/)Linear Regression is of the fundamental Machine Learning techniques that is frequently used. In this tutorial, you will learn:

* the concept of Linear Regression
* the particular case of Linear Regression with one variable
* a working example using a well-known dataset
* how to implement this algorithm in Python and with [TensorFlow](https://www.tensorflow.org/) and **Keras**
* working on the dataset using a powerful library such as [Pandas](https://pandas.pydata.org/)
* investigating and visualizing the data

Here, we investigate the ***Linear regression with one variable*** in *which only one dependent and one independent variable are present*. We later in this post, discuss the concept of dependent and independent variables.

---

Before you continue, you may find the following resources useful:

* Linear Algebra for Machine Learning [[Link](https://www.machinelearningmindset.com/linear-algebra-for-machine-learning-book/)]
* Hands-On Machine Learning with Scikit-Learn and TensorFlow [[Link](https://www.amazon.com/gp/product/1492032646/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=1492032646&linkCode=as2&tag=mlmindset-20&linkId=db352a228eb35fa77c600abacf3a7a9d)]
* Deep Learning with TensorFlow 2 and Keras: Regression, ConvNets… [[Link](https://www.amazon.com/gp/product/1838823417/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=1838823417&linkCode=as2&tag=mlmindset-20&linkId=f3f4d53c243add68fb666934e6d99981)]
* The Hundred-Page Machine Learning Book [[Link](https://www.amazon.com/gp/product/199957950X/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=199957950X&linkCode=as2&tag=mlmindset-20&linkId=6c2983f382d04d47dd991c929377a21b)]
* Python for Data Analysis [[Link](https://www.amazon.com/gp/product/1491957662/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=1491957662&linkCode=as2&tag=mlmindset-20&linkId=c295299637af1b5b32b5471119e2c75a)]

---

### Table Of Contents
* An Introduction to Linear Regression
* A Dataset for Linear Regression
  * Becoming Familiar with Data
    * Characteristics
    * Attributes
  * Data Processing
* Implementation
  * Create the Model
  * Compiling
  * Training
  * Evaluation
* Conclusion

## An Introduction to Linear Regression

In [machine learning](https://www.machinelearningmindset.com/what-is-machine-learning/) and statistics, *Linear Regression* is categorized as a [supervised learning](https://www.machinelearningmindset.com/powerful-supervised-learning/) method and aims to model the **linear relationship** between a variable such as **Y** and at least one independent variable as **X**. In the Linear Regression, the linear relationships will be modeled by a predictor function in which its parameters will be estimated by the data and is called a ***Linear Model\***. The main advantage of the Linear Regression algorithm is its simplicity.

![img](https://www.machinelearningmindset.com/wp-content/uploads/2020/03/linearregline-1024x701.png)

Linear Regression belongs to the general category of **regression analysis** which embraces different kinds of algorithms such as *Linear Regression, Logistic Regression, Ridge Regression, and Lasso Regression*, to name a few. In general, regression analysis is a kind of predictive modeling method that examines the relationship between a **dependent** (target) and some **independent variables** (exploratory).

## A Dataset for Linear Regression

![img](https://www.machinelearningmindset.com/wp-content/uploads/2020/02/bostonhousing-e1583011972889-1024x637.png)

We conduct our experiments using the [Boston house prices dataset](https://scikit-learn.org/stable/datasets/index.html#boston-dataset) as a small suitable dataset which facilitates the experimental settings. The goal of our Linear Regression model is to ***predict\*** *the median value of owner-occupied homes.* We can download the data as below:

```python
# Download the daset with keras.utils.get_file
dataset_path = keras.utils.get_file("housing.data", "https://archive.ics.uci.edu/ml/machine-learning-databases/housing/housing.data")
```

### Becoming Familiar with Data

The characteristics and attributes of the dataset are as below:

#### **Characteristics**

- Number of Instances: 506
- The first 13 features are numeric/categorical predictive features.
- The last one (attribute 14): Median Value is the target variable.

#### **Attributes**

1. **CRIM**: per capita crime rate by town
2. **ZN**: the proportion of residential land zoned for lots over 25,000 sq.ft.
3. **INDUS**: the proportion of non-retail business acres per town
4. **CHAS**: Charles River dummy variable (= 1 if tract bounds river; 0 otherwise)
5. **NOX**: nitric oxides concentration (parts per 10 million)
6. **RM**: average number of rooms per dwelling
7. **AGE**: the proportion of owner-occupied units built prior to 1940
8. **DIS**: weighted distances to five Boston employment centers
9. **RAD**: index of accessibility to radial highways
10. **TAX**: full-value property-tax rate per $10,000
11. **PTRATIO**: pupil-teacher ratio by town
12. **B**: ![1000 \times (Bk - 0.63)^2](https://www.machinelearningmindset.com/wp-content/ql-cache/quicklatex.com-d177f439054b3a33032245db0534c7d6_l3.png) where ![Bk](https://www.machinelearningmindset.com/wp-content/ql-cache/quicklatex.com-94bdd0c2fe1a16049f62daa31ab56ef6_l3.png) is the proportion of blacks by town
13. **LSTAT**: % lower status of the population
14. **MEDV**: Median value of owner-occupied homes in $1000’s [target attribute]

Let’s explore the data. The first step is to show some of the data samples:

```python
column_names = ['CRIM','ZN','INDUS','CHAS','NOX',
                'RM', 'AGE', 'DIS','RAD','TAX','PTRATION', 'B', 'LSTAT', 'MEDV']
raw_dataset = pd.read_csv(dataset_path, names=column_names,
                      na_values = "?", comment='\t',
                      sep=" ", skipinitialspace=True)
# Create a dataset instant
dataset = raw_dataset.copy()
# This function returns last n rows from the object 
# based on position.
dataset.tail(n=10)
```

Using the Pandas library, we created the data frame by assigning columns’ names with attributes (line **1**) and created the data object by reading the downloaded dataset (line **3**). By demonstrating the last 10 rows of the data (line **11**), you should get the following output:

![data exploration](https://www.machinelearningmindset.com/wp-content/uploads/2020/02/image-1024x434.png)

### Data Processing

We should now split data into train/test splits.

```python
# Split data into train/test
# p = training data portion
p = 0.8
trainDataset = dataset.sample(frac=p, random_state=0)
testDataset = dataset.drop(trainDataset.index)
```

Above, we took a portion of the data (![p](https://www.machinelearningmindset.com/wp-content/ql-cache/quicklatex.com-de7f58c02f2ca852481500881db58dd4_l3.png)) for training (line **4**) and the remaining samples for testing (line **5**). Here, we desire to model the relationship between the dependent variable and the independent variable. In the Linear Regression with one variable, *we only have **one** independent and one dependent variable*:

- Independent variable: **‘RM’** [see **attributes**]
- Dependent variable: **‘MEDV’** [see **attributes**]

In a simple word, we want to predict the Median value of owner-occupied homes (in $1000’s) [target attribute] based on the average number of rooms per dwelling (RM). Let’s plot the MEDV against RM, i.e, *visualize how MEDV is changed by changing RM*. Basically we have ![MEDV=f(RM)](https://www.machinelearningmindset.com/wp-content/ql-cache/quicklatex.com-6cb857e5cc700666ae6a5fae010b4fcc_l3.png) and we desire to estimate the function ![f(.)](https://www.machinelearningmindset.com/wp-content/ql-cache/quicklatex.com-259694efebe2d348b8c70e090f057a25_l3.png) using Linear Regression.

```python
# Visual representation of training data
import matplotlib.pyplot as plt
fig, ax = plt.subplots()
# With .pop() command, the associated columns are extracted.
x = trainDataset['RM']
y = trainDataset['MEDV']
ax.scatter(x, y, edgecolors=(0, 0, 0))
ax.set_xlabel('RM')
ax.set_ylabel('MEDV')
plt.show()
```

![img](https://www.machinelearningmindset.com/wp-content/uploads/2020/02/image-1.png)

From the train-test data, we should extract the data and labels associated with the Linear Regression for one variable experiment. We can use two approaches to access the data columns:

1. **Pop command:** It returns an item and drops it from the frame. After using trainDataset.pop(‘RM’), the ‘RM’ column does not exist in the `trainDataset` frame anymore!
2. Using the **indexing with label**s. Example trainDataset[‘RM’]

We use approach **(2)** as below:

```python
# Pop command return item and drop it from frame.
# After using trainDataset.pop('RM'), the 'RM' column 
# does not exist in the trainDataset frame anymore!
trainInput = trainDataset['RM']
trainTarget = trainDataset['MEDV']
testInput = testDataset['RM']
testTarget = testDataset['MEDV']
```

## Implementation

We assume we have the linear model ![y= w_1 x+ w_0](https://www.machinelearningmindset.com/wp-content/ql-cache/quicklatex.com-2a93a6d15627ec8c790cc215cdd6a4d0_l3.png) in which ![w_0](https://www.machinelearningmindset.com/wp-content/ql-cache/quicklatex.com-9c724b9bf59889af8f794f5359c3d14d_l3.png) and ![w_1](https://www.machinelearningmindset.com/wp-content/ql-cache/quicklatex.com-7c786e0998a851e089f0e48168d89c73_l3.png) are two unknown parameters that represent the **intercept** and **slope** of the line. In our implementation, we desire to obtain an estimate of this linear model as ![\hat{y}= \hat{w_1} x+ \hat{w_0}](https://www.machinelearningmindset.com/wp-content/ql-cache/quicklatex.com-52431c99acde73c35867d0be1e615818_l3.png).

For our dataset, we have ![(x_i,y_i)](https://www.machinelearningmindset.com/wp-content/ql-cache/quicklatex.com-247167a5f65fbf722f896f8fb9599c91_l3.png) as pairs of data where ![x_i](https://www.machinelearningmindset.com/wp-content/ql-cache/quicklatex.com-3a7857b57d3ca30f32198442ddfde770_l3.png) and ![y_i](https://www.machinelearningmindset.com/wp-content/ql-cache/quicklatex.com-5a25edd1f60b98bdadff2bbd1f1cad0b_l3.png) are input and target values, respectively. To train our model, we have the general following schema:

![img](https://www.machinelearningmindset.com/wp-content/uploads/2020/03/modeltraining-1024x349.png)

### Create the Model

The first step is to create the model as follows:

1. The architecture of the model
2. Defining the optimizer
3. Compile the model and return the graph

As mentioned above, we desire to find the parameters (**w**) that predict the output ![y](https://www.machinelearningmindset.com/wp-content/ql-cache/quicklatex.com-7529427bc1a9af0322e2f250d357f888_l3.png) from ![x](https://www.machinelearningmindset.com/wp-content/ql-cache/quicklatex.com-18e47b3ed445355ba232dfccfd985d0d_l3.png) in a linear fashion:



 ![\[y= w_1 x+ w_0\]](https://www.machinelearningmindset.com/wp-content/ql-cache/quicklatex.com-8f45e43ca95531a155f372d0406114b2_l3.png)



The above can be defined with the following dense layer:

```python
# We don't specify anything for activation -> no activation is applied (ie. "linear" activation: a(x) = x)
# Check: https://www.tensorflow.org/api_docs/python/tf/keras/layers/Dense
model = keras.Sequential([
      layers.Dense(1, use_bias=True, input_shape=(1,))
    ])
```

This is how the model looks like:

![img](https://www.machinelearningmindset.com/wp-content/uploads/2020/02/image-7.png)



### Compiling

To do the model compiling, we should set the following items:

- **Optimizer**: We use [stochastic gradient descent](https://en.wikipedia.org/wiki/Stochastic_gradient_descent) optimization. TensorFlow is designed to do it for us. We should set an optimizer.
- **Model Compiling schema**: In this step, the job is to define **(1)** how the model is going to behave in terms of optimizing and **(2)** what criteria it should use for optimization. *The criteria for optimization is called loss function which supervises the training*. The linear relationship between two variables of (![X](https://www.machinelearningmindset.com/wp-content/ql-cache/quicklatex.com-597f8460a306ca51ecdbf4ccd022b48c_l3.png),![Y](https://www.machinelearningmindset.com/wp-content/ql-cache/quicklatex.com-289636edca4c123175b5d84dbf63cd0c_l3.png)) is estimated by designing an appropriate optimization problem which its requirement is a proper loss function.

The compiling phase is as below:

```python
# Adam optimizer
optimizer = tf.keras.optimizers.Adam(
    learning_rate=0.01, beta_1=0.9, beta_2=0.99, epsilon=1e-05, amsgrad=False,
    name='Adam')
  
# Model compiling settings
model.compile(loss='mse', optimizer=optimizer, metrics=['mae','mse'])
```

For model compiling, we used:

1. [Adam](https://arxiv.org/abs/1412.6980) as the **optimizer** which is one of the widely used methods. The parameter **amsgrad**is set to **False** and the goal is to implement the basic Adam optimizer [[read more](https://www.tensorflow.org/api_docs/python/tf/keras/optimizers/Adam)].
2. *Mean Square Error (MSE)* metric as the **loss function** for optimization.
3. Both *Mean Square Error (MSE)* and *Mean Absolute Error (MAE)* metric for **model evaluation**.

**What are the \*MSE\* and \*MAE\* metrics?** Assume ![X](https://www.machinelearningmindset.com/wp-content/ql-cache/quicklatex.com-597f8460a306ca51ecdbf4ccd022b48c_l3.png) and ![Y](https://www.machinelearningmindset.com/wp-content/ql-cache/quicklatex.com-289636edca4c123175b5d84dbf63cd0c_l3.png) are independent and dependent variables, respectively. The goal of the model is to predict ![Y](https://www.machinelearningmindset.com/wp-content/ql-cache/quicklatex.com-289636edca4c123175b5d84dbf63cd0c_l3.png) given ![X](https://www.machinelearningmindset.com/wp-content/ql-cache/quicklatex.com-597f8460a306ca51ecdbf4ccd022b48c_l3.png) and the model prediction is ![\hat{Y}](https://www.machinelearningmindset.com/wp-content/ql-cache/quicklatex.com-a61d209f984e189acb611a7b1b7df1d2_l3.png). Then, we have the following definitions:



 ![\[MSE = \frac{1}{\mathcal{N}}\sum_{i=1}^{\mathcal{N}}(\hat{Y_i}-Y_i)^2\]](https://www.machinelearningmindset.com/wp-content/ql-cache/quicklatex.com-53ee077baa4e075a5f7c67e163b5bc39_l3.png)





 ![\[MAE = \frac{1}{\mathcal{N}}\sum_{i=1}^{\mathcal{N}}|\hat{Y_i}-Y_i|\]](https://www.machinelearningmindset.com/wp-content/ql-cache/quicklatex.com-3354d34c609fa709bacb210fb6491cc5_l3.png)



when ![\mathcal{N}](https://www.machinelearningmindset.com/wp-content/ql-cache/quicklatex.com-c26dbc8eb6e360f81c2b5c7f7454e169_l3.png) is the number of samples. Since we picked MSE as the loss function, it indicates that the loss function goal is to *minimize the squared differences between the **real output*** (![Y](https://www.machinelearningmindset.com/wp-content/ql-cache/quicklatex.com-289636edca4c123175b5d84dbf63cd0c_l3.png)) *and the **predicted output*** (![\hat{Y}](https://www.machinelearningmindset.com/wp-content/ql-cache/quicklatex.com-a61d209f984e189acb611a7b1b7df1d2_l3.png)).



### Training

The next step is setting up the actual training phase. For doing so, we have the following parameters:

- **n_epochs**: number of epochs
- **batch_size**: number of samples per batch as the training is conducted with mini-batch optimization.
- validation_split: keep a portion of training data for unbiased validation. The validation set is NOT the test set. In the middle of training, instead of only relying on the training set evaluation, we evaluate our model on the validation set as it provides more insightful results about how the model is improving.
- verbose: set to 0 as we want a short summary and not all the details!!
- callbacks: A callback is a tool to customize the behavior of the model during training, testing, etc.

Having the above parameters, the training phase is done with TensorFlow as below:

```python
# A mechanism that stops training if the validation loss is not improving for more than n_idle_epochs.
n_idle_epochs = 100
earlyStopping = tf.keras.callbacks.EarlyStopping(monitor='val_loss', patience=n_idle_epochs, min_delta=0.01)
# Creating a custom callback to print the log after a certain number of epochs
class NEPOCHLogger(tf.keras.callbacks.Callback):
    def __init__(self,per_epoch=100):
        '''
        display: Number of batches to wait before outputting loss
        '''
        self.seen = 0
        self.per_epoch = per_epoch
    
    def on_epoch_end(self, epoch, logs=None):
      if epoch % self.per_epoch == 0:
        print('Epoch {}, loss {:.2f}, val_loss {:.2f}, mae {:.2f}, val_mae {:.2f}, mse {:.2f}, val_mse {:.2f}'\
              .format(epoch, logs['loss'], logs['val_loss'],logs['mae'], logs['val_mae'],logs['mse'], logs['val_mse']))
        
# Call the object
log_display = NEPOCHLogger(per_epoch=100)
# Training loop
n_epochs = 2000
history = model.fit(
  trainDataOne, trainLabelOne, batch_size=256,
  epochs=n_epochs, validation_split = 0.1, verbose=0, callbacks=[earlyStopping,log_display])
```

Let’s explain the above code.

- **Lines 1-3:** We set the **early stopping mechanism**. The early stopping refers to the situation that we do not want our training to be continued. Why? *Assume we are training a model and evaluating the validation set. After some time, we realize that **there is no improvement** in the validation loss. In this scenario, what is the point of continuing the training?* But the question is how patient we are? We defined the parameter `n_idle_epochs` which clarifies our patience! If for more than n_idle_epochs epochs, our improvement is less than `min_delta`=0.01, then the training should be stopped! Check [tf.keras.callbacks.EarlyStopping](https://www.tensorflow.org/api_docs/python/tf/keras/callbacks/EarlyStopping) function for further details.
- **Lines 5-20:** I created a custom [callback mechanism](https://www.tensorflow.org/api_docs/python/tf/keras/callbacks/Callback) to print the results every 100 epochs. *It seems too much for just a custom printing*!? **Noted that It is a very good practice** to work on custom callbacks as they are very useful when you are working with TensorFlow and Keras.
- **Line 23-26:** The training loop which training the model for `n_epochs` = 2000 and uses the [model.fit](https://www.tensorflow.org/api_docs/python/tf/keras/Model#fit) module. The parameter `batch_size`=256 determines the number of samples for minibatch optimization. The **`validation_split`** is a float number in the range [0,1] which is the portion of the training data that will be used as the validation data. *The model will NOT use this portion for training*!

![img](https://www.machinelearningmindset.com/wp-content/uploads/2020/02/image-8-1024x735.png)The TensorFlow Graph.

The `fit.model` returns a [history object (a callback)](https://www.tensorflow.org/api_docs/python/tf/keras/callbacks/History) for each model. This object stores useful information that we desire to extract and visualize. Let’s explore what is inside `history`:

```python
print('keys:', history.history.keys())
```

The above code returns the following:

```python
keys: dict_keys(['loss', 'mae', 'mse', 'val_loss', 'val_mae', 'val_mse'])
```

which are the training and validation losses. Let’s visualize the MAE loss for training and validation with the code below:

```python
import numpy as np
import pandas as pd
import seaborn as sns
# Returning the desired values for plotting and turn to numpy array
mae = np.asarray(history.history['mae'])
val_mae = np.asarray(history.history['val_mae'])
# Creating the data frame
num_values = (len(mae))
values = np.zeros((num_values,2), dtype=float)
values[:,0] = mae
values[:,1] = val_mae
# Using pandas to frame the data
steps = pd.RangeIndex(start=0,stop=num_values)
data = pd.DataFrame(values, steps, columns=["mae", "va-mae"])
# Plotting
sns.set(style="whitegrid")
sns.lineplot(data=data, palette="tab10", linewidth=2.5)
```

It should return something similar to the below image:

![img](https://www.machinelearningmindset.com/wp-content/uploads/2020/02/image-3-1024x671.png)The training loss is better than validation loss after a while. Early stopping did not let the training continues for 2000 epochs!



### Evaluation

Once the model is trained, its the time for evaluation. The evaluation code is as follows:

```python
predictions = model.predict(testInput).flatten()
a = plt.axes(aspect='equal')
plt.scatter(predictions, testTarget, edgecolors=(0, 0, 0))
plt.xlabel('True Values')
plt.ylabel('Predictions')
lims = [0, 50]
plt.xlim(lims)
plt.ylim(lims)
_ = plt.plot(lims, lims)
```

The `testDataOne`is the test data and `predictions` variable are the model output. We should compare the ground truth data `testLabelOne` which represents the actual values (![Y](https://www.machinelearningmindset.com/wp-content/ql-cache/quicklatex.com-289636edca4c123175b5d84dbf63cd0c_l3.png)) which the predicted values (![\hat{Y}](https://www.machinelearningmindset.com/wp-content/ql-cache/quicklatex.com-a61d209f984e189acb611a7b1b7df1d2_l3.png)). This is set at **line 3** with a scatter plot. The result is as follows:

![Linear Regression model fitting](https://www.machinelearningmindset.com/wp-content/uploads/2020/02/image-6.png)The scatter plot shows the relationship between **true** and **predicted** values of **MEDV** in the dataset.

As can be observed, the model did its best to fit the data, but it’s not simply that powerful! More tweaking might be necessary to fit the model.

Noted that we used the very simple ![y=w_1 x + w_0](https://www.machinelearningmindset.com/wp-content/ql-cache/quicklatex.com-dbb0a748c68701796901b8c55ba8bb1c_l3.png) as the linear model. It’s nice to see how well the line ![y=w_1 x + w_0](https://www.machinelearningmindset.com/wp-content/ql-cache/quicklatex.com-dbb0a748c68701796901b8c55ba8bb1c_l3.png) which is our linear model fits the test data. The below figure shows the model improvement.

![img](https://www.machinelearningmindset.com/wp-content/uploads/2020/03/linearreganim.gif)The **`testInput`** and **`testTarget`** variables are plotted together and demonstrate the input data (RM) vs the target values (MEDV).

As can be observed above, the model is improving to fit the test data. ***Noted** that we have shown how well the model is working on the test data NOT the training data. The training data is used to find the optimal model but the model should ultimately work for the test data*!



## Conclusion

In this tutorial, we walked through one of the most basic and important regression analysis methods called *Linear Regression*. Linear Regression aims to find the dependency of a target variable to one or more independent variables. Here, we investigated the ***simple Linear Regression\***, i.e., *when the target variable* ![Y](https://www.machinelearningmindset.com/wp-content/ql-cache/quicklatex.com-289636edca4c123175b5d84dbf63cd0c_l3.png) *is dependent on only one variable* ![X](https://www.machinelearningmindset.com/wp-content/ql-cache/quicklatex.com-597f8460a306ca51ecdbf4ccd022b48c_l3.png). You learned how to use TensorFlow to train and evaluate a Linear Regression model.



### About The Author

![img](https://secure.gravatar.com/avatar/9960d350071296380e917102f781d749?s=100&d=mm&r=g)

[Sina Torfi](https://www.machinelearningmindset.com/author/amirsina-torfi/)

I am an expert in Machine Learning (ML) and Artificial Intelligence (AI) making ML accessible to a broader audience. I am also an entrepreneur who publishes tutorials, courses, newsletters, and books.