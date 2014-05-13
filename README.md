# Ranked Voting System

Honing my Vala chops. Inspired by [Challenge #136](http://www.reddit.com/r/dailyprogrammer/comments/1r2mcz/112013_challenge_136_intermediate_ranked_voting/) on the [r/dailyprogrammer](http://www.reddit.com/r/dailyprogrammer/) subreddit.

> A [Ranked Voting System](http://en.wikipedia.org/wiki/Ranked_voting_systems) is a system that chooses a result based on a ranked-preference rather than a simple majority. A standard ranked ballot generally has multiple choices, only one of which one can be picked. A ranked ballot allows you to choose the order in which you prefer candidates. An example could be that you prefer choice B first, then choice C, and finally choice A.
There are some neat implications on how this differs from conventional voting systems, and is used in many different countries and states (check out the same [article's list of current uses](https://www.youtube.com/watch?v=3Y3jE3B8HsE) on the overall system; well worth a watch! The overall difference between the two system is that a more agreed-upon candidate could win during a heavily split election.
Your goal is to take a list of candidates and voter's ballots, implement this voting system (using the [Instant-runoff rules](http://en.wikipedia.org/wiki/Instant-runoff_voting)), and print the results of the fictional election.

## Input

Input is taken from a standard console. The first line consists of two space-delimited integers: the number of votes followed by the number of candidates. A space-delimited list of candidates is expected on the next line, followed by the ballots (one per line, ordered from left to right).

### Example

```
5 3
Knuth Turing Church
1 0 2
0 1 2
2 1 0
2 1 0
1 2 0
```

## Compiling

`valac --pkg gee-0.8 irv.vala`

**Note**: gee-0.8 was provided by the libgee package through my package manager. _Your mileage may vary._
