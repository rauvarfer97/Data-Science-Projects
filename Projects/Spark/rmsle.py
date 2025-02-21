from pyspark.ml.evaluation import Evaluator
from math import sqrt
from operator import add
import pyspark.sql.functions as F

class RmsleEvaluator(Evaluator):
    '''
    When a userID is predicted when it is not already trained (all userID  data is used on validation 
    group and none of them to train), prediction is nan,  so RegressionEvaluator returns Nan.
    To solve this we must change RegressionEvaluator by MiValidacion
    '''
    def __init__(self,predictionCol='prediction', targetCol='label'):        
        super(RmsleEvaluator, self).__init__()
        self.predictionCol=predictionCol
        self.targetCol=targetCol
        
    def _evaluate(self, dataset):       
        error=self.rmsle(dataset,self.predictionCol,self.targetCol)
        print ("Error: {}".format(error))
        return error
    
    def isLargerBetter(self):
        return False
    
    @staticmethod
    def rmsle(dataset,predictionCol,targetCol):
        return sqrt(dataset.select(F.avg((F.log1p(dataset[targetCol]) - F.log1p(dataset[predictionCol])) ** 2)).first()[0])

