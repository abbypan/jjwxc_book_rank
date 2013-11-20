jjwxc_book_rank
=================
各种方式计算绿晋江 (http://www.jjwxc.net) 小说排名

主成分分析 pca
--------------

- 原始数据：![book_info.csv](https://www.dropbox.com/s/um7rit5h7b925i3/book_info.csv)
- 代码：![book_rank_pca.r](https://www.dropbox.com/s/9cm0b7zoc6gu87w/book_rank_pca.r)

- 小说的PCA评分总排名(TOP 9000): ![book_rank_pca_top_9k.csv](https://github.com/abbypan/jjwxc_book_rank/blob/master/book_rank_pca_top_9k.csv)
- 小说的PCA评分总排名：![book_rank_pca_v.csv](https://www.dropbox.com/s/jpe1y7853hy7k7g/book_rank_pca_v.csv)

计算过程：

取原始数据中的四列： 积分rank，收藏数collect，评论数comment，单章最大点击量 max_chapter_click

调用pca计算，根据前两个主成分计算，方差贡献达90%
```
> pca
Standard deviations:
[1] 1.7848343 0.6658461 0.5284915 0.3028405

Rotation:
                        PC1        PC2        PC3        PC4
rank              0.5163638 -0.4667678  0.1895280 -0.6925138
collect           0.5036702 -0.3873323 -0.6137144  0.4686625
comment           0.5116272  0.1379844  0.6992417  0.4798531
max_chapter_click 0.4668216  0.7829826 -0.3138388 -0.2655580

> summary(pca)
Importance of components:
                          PC1    PC2     PC3     PC4
Standard deviation     1.7848 0.6658 0.52849 0.30284
Proportion of Variance 0.7964 0.1108 0.06983 0.02293
Cumulative Proportion  0.7964 0.9073 0.97707 1.00000
```
