R For Loop Example

Unlike other program languages, the for loop of R language can be write as for (i in arr) {expr1; expr2 ...}. It goes through the vector arr every time one element i, and execute a group of commands inside the { ... } in each cycle. The break statement can be used to terminate the loop abruptly. If you don't want to terminate the whole loop, but just ignore current cycle, the next statement can do that.

Let's create a vector containing number 1-10:
  >samples <- c(rep(1:10))
>samples
[1]  1  2  3  4  5  6  7  8  9 10

Go through the samples one by one and print them out:
  >for (thissample in samples)
    +{
      +   print(thissample)
      +}
[1] 1
[1] 2
[1] 3
[1] 4
[1] 5
[1] 6
[1] 7
[1] 8
[1] 9
[1] 10


Let's do something inside the for loop:
>for (thissample in samples)
+{
+    str <- paste(thissample,"is current sample",sep=" ")
+    print(str)
+}
[1] "1 is current sample"
[1] "2 is current sample"
[1] "3 is current sample"
[1] "4 is current sample"
[1] "5 is current sample"
[1] "6 is current sample"
[1] "7 is current sample"
[1] "8 is current sample"
[1] "9 is current sample"
[1] "10 is current sample"

Let's terminate the loop when the sample is 3:
  >for (thissample in samples)
    +{
      +    if (thissample == 3) break
      +    str <- paste(thissample,"is current sample",sep=" ")
      +    print(str)
      +}
[1] "1 is current sample"
[1] "2 is current sample"

Let's ignore when the sample number is even:
>for (thissample in samples)
+{
+    if (thissample %% 2 == 0) next
+    str <- paste(thissample,"is current sample",sep=" ")
+    print(str)
+}
[1] "1 is current sample"
[1] "3 is current sample"
[1] "5 is current sample"
[1] "7 is current sample"
[1] "9 is current sample"

Let's just loop through last three samples:
  >end <- length(samples)
>begin <- end - 2
>for (thissample in begin:end)
  +{
    +    str <- paste(thissample,"is current sample",sep=" ")
    +    print(str)
    +}
[1] "8 is current sample"
[1] "9 is current sample"
[1] "10 is current sample"