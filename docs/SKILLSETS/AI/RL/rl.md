-> [中文](/SKILLSETS/AI/RL/rl-cn.md)

# REINFORCEMENT LEARNING
## References
- [Introduction to RL](https://fab.cba.mit.edu/classes/865.21/topics/control/07_reinforcement_learning.html)
  - very succinct and easy to understand
  - good for beginners
  - provides a bigger picture for RL

- [📗] [Dive into Deep Learning: Ch17 Reinforcement Learning](https://d2l.ai/chapter_reinforcement-learning/index.html)
  - Short
  - Easier for begineers
  - Structure
    - 17.1. Markov Decision Process (MDP)
        - 17.1.1. Definition of an MDP
        - 17.1.2. Return and Discount Factor
        - 17.1.3. Discussion of the Markov Assumption
        - 17.1.4. Summary
        - 17.1.5. Exercises
    - 17.2. Value Iteration
         17.2.1. Stochastic Policy
         17.2.2. Value Function
         17.2.3. Action-Value Function
         17.2.4. Optimal Stochastic Policy
         17.2.5. Principle of Dynamic Programming
         17.2.6. Value Iteration
         17.2.7. Policy Evaluation
         17.2.8. Implementation of Value Iteration
         17.2.9. Summary
         17.2.10. Exercises
    - 17.3. Q-Learning
        - 17.3.1. The Q-Learning Algorithm
        - 17.3.2. An Optimization Problem Underlying Q-Learning
        - 17.3.3. Exploration in Q-Learning
        - 17.3.4. The “Self-correcting” Property of Q-Learning
        - 17.3.5. Implementation of Q-Learning
        - 17.3.6. Summary
        - 17.3.7. Exercises

- [🌐] [UCL Course on RL](https://www.davidsilver.uk/teaching/)
  - David Silver

- [📗] [Reinforcement Learning: An Introduction, 2nd Edition](http://incompleteideas.net/book/RLbook2018.pdf)
  - Richard Sutton, Andrew Barto

## Code Practice
- [🌐][Reinforcement Learning](https://github.com/dennybritz/reinforcement-learning.git)
  - Denny Britzs

# Study Notes 
## [📗] [Dive into Deep Learning: Ch17 Reinforcement Learning](https://d2l.ai/chapter_reinforcement-learning/index.html)
### Introduction
  - RL is a paradigm of learning inspired by behavioral psychology, in which learning is achieved through trial and error, with occasional assistance from a human evaluator.
  - Reinforcement Learning (RL) is a suite of techniques that allows us to build machine learning systems that take decisions sequentially.
  - Reinforcement Learning methods allow us to take the appropriate action at each stage of a sequential decision making problem in order to maximize some utility eventually.
  - The key distinction between reinforcement learning and standard deep learning is that in standard deep learning the prediction of a trained model on one test datum does not affect the predictions on a future test datum; in reinforcement learning decisions at future instants (in RL, decisions are also called actions) are affected by what decisions were made in the past.

### Markov Decision Process (MDP)
#### Definition of an MDP
![mdp example](mdp.png ':size=50%')

A simple gridworld navigation task where the robot not only has to find its way to the goal location (shown as a green house) but also has to avoid trap locations (shown as red cross signs).
- A Markov decision process (MDP) (Bellman, 1957) is a model for how the state of a system evolves as different actions are applied to the system. A few different quantities come together to form an MDP.
  - $S$ - the set of states in the MDP. 
  - $A$ - the set of actions in the MDP.
  - $T$ - the transition probability function. $T(s, a, s') = P(s'| s,a)$ is the probability that action $a$ in state $s$ at time $t$ will lead to state $s'$ at time $t + 1$.
  - $r(s,a)$ - the reward function. The reward function is a function of the state and the action taken in that state.

#### Return and Discount Factor
- The different components above together form a Markov decision process (MDP)
- $MDP:(S,A,T,r)$
- starting from $s_0$, and continues taking actions in a trajectory $\tau(s_0,a_0,r_0,s_1,a_1,r_1,s_2,a_2,r_2,...)$.
- each time step t, state $s_t$, action $a_t$, lead to reward $r_t$
- The *return* of a trajectory is the total reward obtained by the robot along such a trajectory
- $R(\tau) = r_0 + r_1 + r_2 + ...$
- The goal in reinforcement learning is to find a trajectory that has the largest return.
- Think of the situation when the robot continues to travel in the gridworld without ever reaching the goal location. The sequence of states and actions in a rajectory can be infinitely long in this case and the return of any such infinitely long trajectory will be infinite. In order to keep the reinforcement learning formulation meaningful even for such trajectories, we introduce the notion of a discount factor $\gamma <1$
- $R(\tau) = r_0 + \gamma r_1 + \gamma ^2 r_2 + ... = \sum_{t=1}^{\infty} \gamma ^t r_t $
- smaller $\gamma$ means the robot cares more about the immediate reward, larger $\gamma$ means the robot cares more about the future reward.

#### Discussion of the Markov Assumption
- Markov systems are all systems where the next state $s_{t+1}$ is only a function of the current state $s_{t}$ and the action $a_{t}$ taken in the current state.
- In Markov systems, the next state does not depend on which actions were taken in the past or the states that the robot was at in the past.
-  It may seem that Markovian nature of a system is a restrictive assumption, but it is not so. Markov Decision Processes are still capable of modeling a very large class of real systems. 
-  For example, for our new robot, if we chose our state $s_{t}$ to the tuple $(location,velocity)$ then the system is Markovian because its next state $(location_{t+1},velocity_{t+1})$ depends only upon the current state $(location_{t},velocity_{t})$ and the action at the current state $s_{t}$.

#### Summary
The reinforcement learning problem is typically modeled using Markov Decision Processes. A Markov decision process (MDP) is defined by a tuple of four entities $(S,A,T,r)$ where $S$ is the set of states, $A$ is the set of actions, $T$ is the transition function that encodes the transition probabilities of the MDP and $r$ is the immediate reward obtained by taking action at a particular state. 

### Value Iteration
- In this section we will discuss how to pick the best action for the robot at each state to maximize the return of the trajectory. We will describe an algorithm called Value Iteration and implement it for a simulated robot that travels over a frozen lake.
#### Stochastic Policy
- A stochastic policy denoted as $\pi(a|s)$(policy for short) is a conditional distribution over the action $a \in A $ given the state $s \in S$, $\pi(a|s) \equiv P(a|s)$.
- To make the notation less cumbersome, we will often write $\pi(s)$ as the conditional distribution instead of $\pi(a|s)$
.
#### Value Function

#### Action-Value Function
#### Optimal Stochastic Policy
#### Principle of Dynamic Programming
#### Value Iteration
#### Policy Evaluation
#### Implementation of Value Iteration
#### Summary


### Q-Learning
#### The Q-Learning Algorithm
#### An Optimization Problem Underlying Q-Learning
#### Exploration in Q-Learning
#### The “Self-correcting” Property of Q-Learning
#### Implementation of Q-Learning
#### Summary
