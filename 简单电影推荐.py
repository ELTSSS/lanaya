"""
==============
构建电影推荐系统
==============
http://blog.csdn.net/u013185349/article/details/61192218

"""
print(__doc__)

# 电影打分数据
data = {'Lisa Rose': {'Lady in the Water': 2.5, 'Snakes on a Plane': 3.5,
                      'Just My Luck': 3.0, 'Superman Returns': 3.5, 'You, Me and Dupree': 2.5,
                      'The Night Listener': 3.0},

        'Gene Seymour': {'Lady in the Water': 3.0, 'Snakes on a Plane': 3.5,
                         'Just My Luck': 1.5, 'Superman Returns': 5.0, 'The Night Listener': 3.0,
                         'You, Me and Dupree': 3.5},

        'Michael Phillips': {'Lady in the Water': 2.5, 'Snakes on a Plane': 3.0,
                             'Superman Returns': 3.5, 'The Night Listener': 4.0},

        'Claudia Puig': {'Snakes on a Plane': 3.5, 'Just My Luck': 3.0,
                         'The Night Listener': 4.5, 'Superman Returns': 4.0,
                         'You, Me and Dupree': 2.5},

        'Mick LaSalle': {'Lady in the Water': 3.0, 'Snakes on a Plane': 4.0,
                         'Just My Luck': 2.0, 'Superman Returns': 3.0, 'The Night Listener': 3.0,
                         'You, Me and Dupree': 2.0},

        'Jack Matthews': {'Lady in the Water': 3.0, 'Snakes on a Plane': 4.0,
                          'The Night Listener': 3.0, 'Superman Returns': 5.0, 'You, Me and Dupree': 3.5},

        'Toby': {'Snakes on a Plane': 4.5, 'You, Me and Dupree': 1.0, 'Superman Returns': 4.0}
        }


#
# 因为计算以电影物品为主，所以先将上面data[user][movie]数据转换成newdata[movie][user]格式，
# 也即二维矩阵进行行列对换
#
def transformdata(data):
    '''
    物品之间的相似度 与 用户之间的相似度 求解 一样。故只需要将用户换成物品即可
    '''
    newdata = {}
    for person in data:
        for movie in data[person]:
            # 初始化
            newdata.setdefault(movie, {})
            # 物品与用户对调
            newdata[movie][person] = data[person][movie]  # 字典可以直接写[key]，就表示插入key值了。非常简便
    return newdata


print("1. 电影打分:")
print(transformdata(data))
print("")

from math import sqrt

def sim_distance(data, person1, person2):
    '''欧氏距离求相似度，距离越大，越相似'''
    commonmovies = [movie for movie in data[person1] if movie in data[person2]]
    if len(commonmovies) == 0: return 0
    # 平方和
    sumSq = sum([pow(data[person1][movie] - data[person2][movie], 2) for movie in commonmovies])
    # 使最终结果是，越相似，距离越大。所以将上面距离取倒数即可
    sim = 1 / (1 + sqrt(sumSq))
    return sim

def sim_pearson(data, person1, person2):
    '''
    计算上面格式的数据 里的  两个用户 相似度.
    基于用户过滤思路：找出两个用户看过的相同电影的评分，从而进行按pearson公式求值。那些非公共电影不列入求相似度值范围。
    基于物品过滤思路：找过两部电影相同的观影人给出的评分，从而按pearson公式求值
    返回：评分的相似度，[-1,1]范围，0最不相关，1，-1为正负相关，等于1时，表示两个用户完全一致评分
    这里的data格式很重要，这里计算相似度是严格按照上面data格式所算。
    此字典套字典格式，跟博客计算单词个数 存储格式一样
    '''
    # 计算pearson系数，先要收集两个用户公共电影名单
    # commonmovies = [ movie for movie in data[person1] if movie in data[person2]] 分解步骤为如下：
    commonmovies = []  # 改成列表呢
    for movie in data[person1]:  # data[person1]是字典，默认第一个元素 in （字典）是指 key.所以这句话是指 对data[person1]字典里遍历每一个key=movie
        if movie in data[person2]:  # data[person2]也是字典，表示该字典有key是movie.
            commonmovies.append(movie)  # commonmovie是  两个用户的公共电影名的列表

    # 看过的公共电影个数
    n = float(len(commonmovies))
    if n == 0:
        return 0

    '''下面正是计算pearson系数公式 '''
    # 分布对两个用户的公共电影movie分数总和
    sum1 = sum([data[person1][movie] for movie in commonmovies])
    sum2 = sum([data[person2][movie] for movie in commonmovies])

    # 计算乘积之和
    sum12 = sum([data[person1][movie] * data[person2][movie] for movie in commonmovies])

    # 计算平方和
    sum1Sq = sum([pow(data[person1][movie], 2) for movie in commonmovies])
    sum2Sq = sum([pow(data[person2][movie], 2) for movie in commonmovies])

    # 计算分子
    num = sum12 - sum1 * sum2 / n
    # 分母
    den = sqrt((sum1Sq - pow(sum1, 2) / n) * (sum2Sq - pow(sum2, 2) / n))
    if den == 0:  return 0

    return num / den


def topmatches(data, givenperson, returnernum=5, simscore=sim_pearson):
    '''
    用户匹配推荐：给定一个用户，返回对他口味最匹配的其他用户
    物品匹配： 给定一个物品，返回相近物品
    输入参数：对person进行默认推荐num=5个用户（基于用户过滤），或是返回5部电影物品（基于物品过滤），相似度计算用pearson计算
    '''
    # 建立最终结果列表
    usersscores = [(simscore(data, givenperson, other), other) for other in data if other != givenperson]
    # 对列表排序
    usersscores.sort(key=None, reverse=True)

    return usersscores[0:returnernum]


moviedata = transformdata(data)

print("2. 找出跟“超人回归”这电影相关的电影:")
print(topmatches(moviedata, 'Superman Returns'))
print("")


def calSimilarItems(data, num=10):
    # 以物品为中心，对偏好矩阵转置
    moviedata = transformdata(data)
    ItemAllMatches = {}
    for movie in moviedata:
        ItemAllMatches.setdefault(movie, [])
        # 对每个电影 都求它的匹配电影集,求电影之间的距离用pearson距离
        ItemAllMatches[movie] = topmatches(moviedata, movie, num, simscore=sim_pearson)
    return ItemAllMatches


print("3. 列出所有电影之间的相关性:")
print(calSimilarItems(data))
print("")

"""
推荐用户没看过的电影

某一部未看过电影分数= sum（该部未看过的电影与每一部已看电影之间相似度*已看电影的评分）/sum(未看电影与每一部已看电影之间相似度)
例如：未看电影A,已看电影B,C:
则，电影A分数 =  [sim(A,B)*rating(B) +sim(A,C)*rating(C)] / [ sim(A,B) + sim(A,C)]
"""


def getrecommendations(data, targetperson, moviesAllsimilarity):
    '''
    输入movieAllSimilarity就是上面calsimilarItems已经计算好的所有物品之间的相似度数据集：
     '''
    # 获得所有物品之间的相似数据集
    scoresum = {}
    simsum = {}
    # 遍历所有看过的电影
    for watchedmovie in data[targetperson]:
        rating = data[targetperson][watchedmovie]
        # 遍历与当前电影相近的电影
        for (similarity, newmovie) in moviesAllsimilarity[watchedmovie]:  # 取一对元组
            # 已经对当前物品评价过，则忽略
            if newmovie in data[targetperson]: continue

            scoresum.setdefault(newmovie, 0)
            simsum.setdefault(newmovie, 0)
            # 全部相似度求和
            simsum[newmovie] += similarity
            # 评价值与相似度加权之和
            scoresum[newmovie] += rating * similarity

    rankings = [(score / simsum[newmovie], newmovie) for newmovie, score in scoresum.items()]
    rankings.sort(key=None, reverse=True)
    return rankings


itemsAllsim = calSimilarItems(data)  # 这个值会事先计算好
print('4. 基于物品过滤，为用户Toby推荐的电影是：')
print(getrecommendations(data, 'Toby', itemsAllsim))
print()

print("5. 为用户Toby推荐品味相当的用户:")
print(topmatches(data, 'Toby', 3))
print()

"""
推荐未看过的电影：
未看过电影分数=sum（被推荐用户与其他用户之间相似度*用户对该电影评分）/sum(被推荐用户与其他用户之间相似度)
"""


def recommendItems(data, givenperson, num=5, simscore=sim_pearson):
    '''
    物品推荐：给定一个用户person,默认返回num=5物品
    要两个for,对用户，物品 都进行 遍历
    '''
    # 所有变量尽量用字典，凡是列表能表示的字典都能表示，那何不用字典
    itemsimsum = {}
    # 存给定用户没看过的电影的其他用户评分加权
    itemsum = {}

    # 遍历每个用户，然后遍历该用户每个电影
    for otheruser in data:
        # 不要和自己比较
        if otheruser == givenperson:   continue
        # 忽略相似度=0或小于0情况
        sim = simscore(data, givenperson, otheruser)
        if sim <= 0:   continue

        for itemmovie in data[otheruser]:
            # 只对用户没看过的电影进行推荐，参考了其他用户的评价值（协同物品过滤是参考了历史物品相似度值）
            if itemmovie not in data[givenperson]:
                # 一定要初始化字典：初始化itemsum与itemsimsum
                itemsum.setdefault(itemmovie, 0)
                itemsimsum.setdefault(itemmovie, 0)
                # 用户相似度*评价值
                itemsum[itemmovie] += sim * data[otheruser][itemmovie]
                itemsimsum[itemmovie] += sim

                # 最终结果列表，列表包含一元组（item,分数）
    rankings = [(itemsum[itemmovie] / itemsimsum[itemmovie], itemmovie) for itemmovie in itemsum]
    # 结果排序
    rankings.sort(key=None, reverse=True);
    return rankings


# 调用此方法如下：
print("6. 为用户Toby推荐未看过的电影:")
print(recommendItems(data, 'Toby', 3))
print()