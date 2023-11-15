-> [English](/SKILLSETS/CONTROL/PID/pid.md)

# PID控制 - 比例积分微分控制

## 理论
- [PID控制算法原理（抛弃公式，从本质上真正理解PID控制）](https://zhuanlan.zhihu.com/p/39573490)
  - 点评：
    - 文章从生活实际出发，讲解了PID算法的本质，最后再回归公式，浅显易懂，值得一读！
    - 本文可以帮助读者直观地理解PID。

![PID控制算法原理（抛弃公式，从本质上真正理解PID控制）](PID.jpg ':size=100%')
来源：知乎@确定有穷自动机

- [PID算法讲解（原理+算法+源码）](https://www.cnblogs.com/tdyizhen1314/p/16998628.html)
  - 点评：
    - 没有上面一篇惊艳，可以作为补充参考。

- [PID算法解析及程序代码](https://blog.csdn.net/acktomas/article/details/102991704)
  - 点评：
    - 这篇文章最突出的价值在于可以帮助深入理解PID各个参数的实际意义。
    - 小明打水的例子绝了：
      - 小明接到这样一个任务：有一个水缸有点漏水(而且漏水的速度还不一定固定不变)，要求水面高度维持在某个位置，一旦发现水面高度低于要求位置，就要往水缸里加水。 小明接到任务后就一直守在水缸旁边，时间长就觉得无聊，就跑到房里看小说了，每30分钟来检查一次水面高度。水漏得太快，每次小明来检查时，水都快漏完了，离要求的高度相差很远，小明改为每3分钟来检查一次，结果每次来水都没怎么漏，不需要加水，来得太频繁做的是无用功。几次试验后，确定每10分钟来检查一次。这个检查时间就称为**采样周期**。
      - 开始小明用瓢加水，水龙头离水缸有十几米的距离，经常要跑好几趟才加够水，于是小明又改为用桶加，一加就是一桶，跑的次数少了，加水的速度也快了，但好几次将缸给加溢出了，不小心弄湿了几次鞋，小明又动脑筋，我不用瓢也不用桶，老子用盆，几次下来，发现刚刚好，不用跑太多次，也不会让水溢出。这个加水工具的大小就称为**比例系数**。
      - 小明又发现水虽然不会加过量溢出了，有时会高过要求位置比较多，还是有打湿鞋的危险。他又想了个办法，在水缸上装一个漏斗，每次加水不直接倒进水缸，而是倒进漏斗让它慢慢加。这样溢出的问题解决了，但加水的速度又慢了，有时还赶不上漏水的速度。于是他试着变换不同大小口径的漏斗来控制加水的速度，最后终于找到了满意的漏斗。漏斗的时间就称为**积分时间**。
      - 小明终于喘了一口，但任务的要求突然严了，水位控制的及时性要求大大提高，一旦水位过低，必须立即将水加到要求位置，而且不能高出太多，否则不给工钱。小明又为难了！于是他又开努脑筋，终于让它想到一个办法，常放一盆备用水在旁边，一发现水位低了，不经过漏斗就是一盆水下去，这样及时性是保证了，但水位有时会高多了。他又在要求水面位置上面一点将水缸要求的水平面处凿一孔，再接一根管子到下面的备用桶里这样多出的水会从上面的孔里漏出来。这个水漏出的快慢就称为**微分时间**。

- [一篇文章带你搞懂使用PID](https://rymcu.com/article/1195)
  - 点评：
    - 这篇写得也非常好，结合了加水的例子和代码。
    - 循序渐进，讲解了Kp，Ki，Kd的作用。

- [PID原理及python简单实现与调参](https://juejin.cn/post/7135073754467532813)
  - 点评：
    - 可以重点关注里面的牛顿法调参

## 代码
- [一篇文章带你搞懂使用PID](https://rymcu.com/article/1195)
  - 代码下载链接：<a href="/docs/SKILLSETS/CONTROL/PID/PID_Code.ipynb" target="_blank">一篇文章带你搞懂使用PID-代码</a>
  - 点评：
    - 里面的Python代码拿来作为学习材料不错。
    - 下文代码来自于本篇。
- [PID模拟仿真实验](https://zhuanlan.zhihu.com/p/189319094)

### 比例控制算法 - Kp

```
import matplotlib.pyplot as plt

class ApplicationWithKp:
    def __init__(self, ex=1, current=0.2, kp=0.5):
        self.ex = ex
        self.current = current
        self.kp = kp
        self.error = self.ex - self.current
        self.iterate_times = 0

        self.output_list = [self.current]
        self.error_list = [self.error]

    def run(self):
        self.iterate(100)
        self.plot()
        print(self.output_list)
        print("[info] iterate times: ", self.iterate_times)

    def iterate(self, epoch):
        """ iterate to update current, error """
        for i in range(epoch):
            # 加水量u
            u = self.kp * self.error
            self.current += u
            self.output_list.append(self.current)
            self.error_list.append(self.error)
            self.error = self.ex - self.current
            if self.current >= self.ex:
                self.iterate_times = i
                return
            self.iterate_times = epoch

    def plot(self):
        l1, = plt.plot(list(range(len(self.output_list))), self.output_list, label='output')
        l2, = plt.plot(list(range(len(self.error_list))), self.error_list, label='error', linestyle='--', color='r')
        l3 = plt.plot(list(range(len(self.output_list))), [1] * len(self.output_list), linestyle='--', color='g'  )
        plt.xlabel('times / s')
        plt.ylabel('water volume / (m^3)')
        plt.legend(handles=[l1, l2],
                   labels = ['output', 'error'])
        plt.show()

app = ApplicationWithKp()
app.run()
```
改变参数值，查看Kp作用：

```
app_2 = ApplicationWithKp(kp=0.9)
app_2.run()
```

### 比例积分控制算法 - Kp, Ki
```
import matplotlib.pyplot as plt

class ApplicationWithKpKi:
    def __init__(self, ex=1, current=0.2, kp=0.5, ki=0.05):
        self.ex = ex
        self.current = current
        self.kp = kp
        self.ki = ki
        self.error = self.ex - self.current
        self.error_acc = self.error # error accumulation
        self.iterate_times = 0

        self.output_list = [self.current]
        self.error_list = [self.error]

    def run(self):
        self.iterate(50)
        self.plot()
        print(self.output_list)
        print("[info] iterate times: ", self.iterate_times)

    def iterate(self, epoch):
        """ iterate to update current, error """
        for i in range(epoch):
            # 加水量u
            u = self.kp * self.error + self.ki * self.error_acc
            self.current += u
            self.output_list.append(self.current)
            self.error_list.append(self.error)
            self.error = self.ex - self.current
            self.error_acc += self.error
            # if self.current >= self.ex:
            #     self.iterate_times = i
            #     return
            self.iterate_times = epoch

    def plot(self):
        l1, = plt.plot(list(range(len(self.output_list))), self.output_list, label='output')
        l2, = plt.plot(list(range(len(self.error_list))), self.error_list, label='error', linestyle='--', color='r')
        l3 = plt.plot(list(range(len(self.output_list))), [1] * len(self.output_list), linestyle='--', color='g'  )
        plt.xlabel('times / s')
        plt.ylabel('water volume / (m^3)')
        plt.legend(handles=[l1, l2],
                   labels = ['output', 'error'])
        plt.show()

if __name__ == '__main__':
    app = ApplicationWithKpKi(kp=0.5, ki=0.05)
    app.run()
```
### 比例积分微分控制算法 - Kp, Ki, Kd
```
import matplotlib.pyplot as plt

class ApplicationWithKpKiKd:
    def __init__(self, ex=1, current=0.2, kp=0.5, ki=0.05, kd=0.1):
        self.ex = ex
        self.current = current
        self.kp = kp
        self.ki = ki
        self.kd = kd
        self.error = self.ex - self.current
        self.error_acc = self.error # error accumulation
        self.delta_error = self.error # d_e = e(t) - e(t-1)
        self.iterate_times = 0

        self.output_list = [self.current]
        self.error_list = [self.error]

    def run(self):
        self.iterate(50)
        self.plot()
        print(self.output_list)
        print("[info] iterate times: ", self.iterate_times)

    def iterate(self, epoch):
        """ iterate to update current, error """
        for i in range(epoch):
            # 加水量u
            u = self.kp * self.error + self.ki * self.error_acc + self.kd * self.delta_error
            self.current += u
            self.error = self.ex - self.current
            self.error_acc += self.error
            self.delta_error = self.error - self.error_list[-1]

            self.output_list.append(self.current)
            self.error_list.append(self.error)
            self.iterate_times = epoch

    def plot(self):
        l1, = plt.plot(list(range(len(self.output_list))), self.output_list, label='output')
        l2, = plt.plot(list(range(len(self.error_list))), self.error_list, label='error', linestyle='--', color='r')
        l3 = plt.plot(list(range(len(self.output_list))), [1] * len(self.output_list), linestyle='--', color='g'  )
        plt.xlabel('times / s')
        plt.ylabel('water volume / (m^3)')
        plt.legend(handles=[l1, l2],
                   labels = ['output', 'error'])
        plt.show()

if __name__ == '__main__':
    app = ApplicationWithKpKiKd(kp=0.5, ki=0.1, kd=0.3)
    app.run()
```

### 快速上手PID： simple-pid 库
```
!pip install simple-pid

import os
import sys
import time
import matplotlib.pyplot as plt
from simple_pid import PID


class WaterBoiler:
    """
    Simple simulation of a water boiler which can heat up water
    and where the heat dissipates slowly over time
    """

    def __init__(self):
        self.water_temp = 20

    def update(self, boiler_power, dt):
        if boiler_power > 0:
            # Boiler can only produce heat, not cold
            self.water_temp += 1 * boiler_power * dt

        # Some heat dissipation
        self.water_temp -= 0.02 * dt
        return self.water_temp


if __name__ == '__main__':
    boiler = WaterBoiler()
    water_temp = boiler.water_temp

    pid = PID(5, 0.01, 0.1, setpoint=water_temp)
    pid.output_limits = (0, 100)

    start_time = time.time()
    last_time = start_time

    # Keep track of values for plotting
    setpoint, y, x = [], [], []

    while time.time() - start_time < 10:
        current_time = time.time()
        dt = current_time - last_time

        power = pid(water_temp)
        water_temp = boiler.update(power, dt)

        x += [current_time - start_time]
        y += [water_temp]
        setpoint += [pid.setpoint]

        if current_time - start_time > 1:
            pid.setpoint = 100

        last_time = current_time

    plt.plot(x, y, label='measured')
    plt.plot(x, setpoint, label='target')
    plt.xlabel('time')
    plt.ylabel('temperature')
    plt.legend()
    if os.getenv('NO_DISPLAY'):
        # If run in CI the plot is saved to file instead of shown to the user
        plt.savefig(f"result-py{'.'.join([str(x) for x in sys.version_info[:2]])}.png")
    else:
        plt.show()
```

### 牛顿法调参
```
from scipy import optimize 
import matplotlib.pyplot as plt
import numpy as np

def pid_plot(args, plot_flag=True, print_flag=False):
    kp, ki, kd = args
    T=1
    Tn=0.2
    error=1-0.2
    extra_drop = 0.1
    sum_error = 0
    d_error = 0
    error_n = 0
    error_b = 0
    Tn_list = []
    for t in range(1, 100):
        error_b = error_n
        error_n = error
        d_error = error_n - error_b if t >= 2 else 0
        sum_error += error
        U = kp * error + ki * sum_error + kd * d_error
        Tn += U - extra_drop
        error = T-Tn
        Tn_list.append(Tn)
        if print_flag:
            print(f't={t} | add {U:.5f} => Tn={Tn:.5f} error={error:.5f} | d_error: {d_error:.5f}')

    if plot_flag:
        plt.plot(Tn_list)
        plt.axhline(1, linestyle='--', color='darkred', alpha=0.8)
        plt.title(f'$K_p$={kp:.3f} $K_i$={ki:.3f} $K_d$={kd:.3f}')
        plt.ylim([0, max(Tn_list) + 0.2])
        plt.show()

    loss = np.sqrt(np.mean(np.square(np.ones_like(Tn_list) - np.array(Tn_list))))
    return loss



boundaries=[(0, 2), (0, 2), (0, 2)]
res = optimize.fmin_l_bfgs_b(pid_plot, np.array([0.1, 0.1, 0.1]), args=(False, False), bounds = boundaries, approx_grad = True)

pid_plot(res[0].tolist(), print_flag=True)
pid_plot([0.65, 0.05, 0.5], print_flag=True)

```