# Project Governance

This document outlines the governance of the [EasyBuild](https://easybuild.io) open source software project and related infrastructure.

## 1. Guiding Principles {: #guiding-principles }

The value of EasyBuild grows exponentially with two things: the amount of systems on which EasyBuild is used,
and the amount of software that is supported by EasyBuild.

The first goal of this governance is to make sure everyone in the community feels sufficiently included
so that they are willing to use and contribute to EasyBuild (rather than implement their own solution).

The second goal of this governance is to make clear how and by whom decisions in EasyBuild are taken. This is because trust in this process is important, both to infrastructure providers using EasyBuild to manage the central software stack on their systems, as well as for regular end users of EasyBuild who use it to do local software installations.

Note that this concerns both large decisions, such as which features will (not) be implemented in EasyBuild,
as well as small decisions, such as adding support for installing a specific software package in EasyBuild.

To achieve both goals, our governance is based on the [meritocracy](https://en.wikipedia.org/wiki/Meritocracy) governance model.


## 2. Roles and Responsibilities {: #roles-and-responsibilities }

Below the roles and responsibilities related to the EasyBuild project are discussed.

The group of people with a common role will be referred to as a *team* in the remainder of this document.
Exceptions are contributors and end users, which are not considered to be teams.
Each individual in a team will be referred to as a *team member*.


### 2.1 Owners of the `easybuilders` GitHub organization & repositories {: #owners-github-org }

The owners of the [`easybuilders` GitHub organization](https://github.com/easybuilders) & repositories are those individuals
with `owner` rights on the `easybuilders` GitHub organization or one of its associated repositories.

They are responsible for setting permissions on the code repositories, compliant to the defined roles and responsibilities.


### 2.2 Release Managers {: #release-managers }

The EasyBuild release managers are responsible for regularly publishing new stable releases of EasyBuild.

EasyBuild releases are published via [PyPI](https://pypi.org/project/easybuild/), and corresponding tags and releases
are created in the relevant EasyBuild GitHub repositories.

In addition, detailed [release notes](../../release-notes.md) are composed, and the release is announced
via the various EasyBuild community channels (mailing list, Slack, social media).

The intention is to have a new EasyBuild release published every 8-10 weeks (~2 months).


### 2.3 Maintainers of the EasyBuild GitHub repositories {: #maintainers_github_repos }

Repository maintainers are individuals with write access to (one or more of) the EasyBuild GitHub repositories.

They are responsible for processing contributions, by reviewing, testing, and merging pull requests.


### 2.4 Maintainers of the EasyBuild infrastructure {: #maintainers_infrastructure }

Infrastructure maintainers are those individuals that maintain the infrastructure that is used to publish, develop, and test EasyBuild.
This includes (but may not be limited to):

- the `easybuild.io` domain;
- the `sources.easybuild.io` fallback for source URLs; 
- the virtual cluster on which the test bot runs that helps with testing contributions in pull requests.

Infrastructure maintainers are responsible for monitoring and maintaining this infrastructure,
and providing access to those who need it according to the Roles and Responsibilities described here.


### 2.5 Reviewers {: #reviewers }

Reviewers are individuals who help with reviewing and testing contributions that are made to EasyBuild through pull requests.

Note that reviewers do *not* necessarily have the rights to approve & merge pull requests.


### 2.6 Bot users {: #bot-users }

Bot users are those individuals who have been granted permissions to trigger the central test bot that is used to test contributions.

They are responsible for determining when it is appropriate to trigger a test of a pull request.

Note that bot users do *not* necessarily have the rights to approve & merge pull requests.


### 2.7 Triagers {: #triagers }

Triagers are individuals who have the permission to assign labels to issues and pull requests to categorize them, and to close them when deemed appropriate.

Note that triagers do *not* necessarily have the rights to approve & merge pull requests.


### 2.8 Contributors {: #contributors }

Contributors are individuals that make a contribution by opening a pull request to one of the repositories
in the [`easybuilders` GitHub organization](https://github.com/easybuilders).

They are responsible for making sure that their contribution is working as intended,
and that it is valuable to other members of the EasyBuild community.


### 2.9 End Users {: #end-users }

End users of EasyBuild are individuals that use EasyBuild to install software.

This includes both system administrators using EasyBuild to do site-wide software installations,
as well as others using EasyBuild to do local software installations.


## 3. Decision Making

This section applies to the decision making procedure for the teams discussed in the [Roles and Responsibilities](#roles-and-responsibilities) Section.

The Steering Committee has its own decision making procedure (defined in the [Voting by the Steering Committee](#voting-by-sc) Section).


### 3.1 Consensus Seeking

Decisions are made by seeking consensus. Each team member is responsible for deciding whether an issue or decision is significant or sensitive
enough to warrant discussions within their team. If so, they should bring it up through the agreed upon channels
(see the [Meetings and Communication](#meetings-and-communication) Section).


### 3.2 Voting

There is no formal voting for teams, for two reasons:

1. The teams may be too big to organize voting in a quick, practical way.
2. The obligation to take part in votes may discourage people to become part of these teams, as it may be seen as a burden.

Voting may nonetheless be used as a way to achieve consensus. For example, asking (a relevant subset of) the team to vote
may be one way to determine the majority opinion. Then, it can be discussed if the majority vote is an acceptable outcome to the team.
If so, consensus is achieved.


### 3.3 Deadlock Resolution

If consensus cannot be reached within the team, the Steering Committee can take the decision for them.

This can be either requested by the team, or done at the initiative of the Steering Committee, if they feel the lack of a decision is preventing the project from moving forward.

Also, if multiple teams claim ownership over an issue, the Steering Committee can decide which team is allowed to decide over the issue.


### 3.4 Overturning decisions

The goal is for teams to operate autonomously as much as possible. 
However, in exceptional cases, the Steering Committee _can_ overrule a decision made by any of the teams.
**This should only be done as a last resort.**

Examples of when this may be considered include if the Steering Committee feels that a decision endangers
the integrity or sustainability of the project, or goes against the policies the Steering Committee has defined.
Even then, the Steering Committee should first engage in a discussion with a team to see if consensus
can be achieved on changing the decision.


## 4. Meetings and Communication { #meetings-and-communication }

While each team is allowed to use the communication channels that they jointly agree upon, the following channels are suggested:

- EasyBuild GitHub repositories;
- EasyBuild Slack;
- Bi-weekly EasyBuild online meetings;
- Additional (periodic or incidental) video calls.

## 5. Onboarding and Offboarding
This Section applies to the teams described in the [Roles and Responsibilities](#roles-and-responsibilities) Section.

### 5.1 Adding Team Members

Teams themselves decide how large their teams should ideally be. They also decide the procedure to add new team members.

The procedure should reflect the sensitivity of the position, i.e. people with certain roles have the ability to
(intentionally or unintentionally) determine which changes are included in the next EasyBuild release.
For such roles, the procedure should make sure candidates are extensively vetted and trusted by both the team as well as the EasyBuild community as a whole.

As with all decisions the decision to add a team member is subject to article 3.4.


### 5.2 Removing Team Members

Teams themselves decide the procedure to remove team members. As for the procedure of adding team members,
the procedure to remove team Members should reflect the sensitivity of the position.

As with all decisions, the decision to remove a team member is subject to article 3.4.


## 6 Steering Committee


### 6.1 Responsibilities

The Steering Committee shall be responsible for:

- Outlining the technical direction of the EasyBuild project and setting priorities;
- Conflict resolution: if there is a conflict between the people with the aforementioned roles,
  the steering committee shall mediate the dispute and make a final decision if consensus cannot be reached;
- The [EasyBuild Charter](charter.md);
- The [EasyBuild Governance](governance.md) (this document);
- The [EasyBuild Policies](policies.md);
- The [EasyBuild Code of Conduct](code-of-conduct.md);


### 6.2 Members and Chairs

The Steering Committee is made up of community members with sustained and recognized contributions over time. Members take part in the Steering Committee as private individuals (i.e. they do not represent their employer(s)).


#### 6.2.1 Termination of Membership

Membership of the Steering Committee can terminate in three ways:

- A member can resign;
- A member may be voted out. In this case, the vote needs to be unanimous between the other members.
  This procedure is intended to provide a mechanism for addressing extraordinary circumstances where
  a member's behavior or actions are deemed severely detrimental to the committee's function or
  reputation, and/or to the EasyBuild project.
- If a member is inactive for 6 months and does not reply to any communication from the rest of the
  Steering Committee, the member may be voted out by the other Steering Committee members.
  In this case, [regular voting rules](#voting-by-sc) apply. Exceptions can be made if a member
  gave prior notice to the Steering Committee about being incommunicado for an extended period of time.


#### 6.2.2 New Members

New members must be recommended by one or more Steering Committee members.

The Steering Committee will make the recommendation known to the community, and collect feedback on the recommendation.
The Steering Committee then weighs the feedback, and votes on whether to accept the new member.

In the selection process, the Steering Committee will consider the following:

- The Steering Committee ideally consists of an odd number of Members
  (to reduce chances of a tie when voting);
- No more than 30% of the Members should be employed by commercial entities
  (to avoid that the project becomes dominated by commercial interests);
- The number of Members working for the same employer should be limited to 1
  (to avoid that the project becomes dominated by a single company or institution, or a small group thereof);
- The number of Members with the same country of residence should be limited to 2 
 (to reflect the international nature of the project);
- The composition of the Steering Committee should reflect the EasyBuild community
  (to ensure that the community's interests are represented);

Note that if Members change jobs, or move to another country, some of the above criteria that were taken
into account during selection may no longer be satisfied. It is up to the Steering Committee to decide
if this is problematic, and if so, try to restore balance by requesting someone's resignation.


#### 6.2.3 Alternates

Members may appoint an alternate that may represent them and vote on their behalf in case they are unavailable.
An alternate is appointed by a member simply by informing the Chair. The alternate may be appointed for a
single meeting, or until further notice. If a member resigns or is voted out from the Steering Committee,
their alternate immediately loses any rights they had as an alternate.


#### 6.2.4 Chair

A chair will be appointed by the Steering Committee to serve for a one-year term. The chair is responsible
for organizing and leading the Steering Committee meetings (e.g. preparing and sending around an agenda,
bringing items to a vote, counting the votes, ensuring meeting notes are kept and made available to
the Steering Committee Members, etc).

The chair can appoint another member to serve as acting chair for a given meeting or period.

If there is no chair (e.g. because the chair's term was completed, or the chair stepped down from
the Steering Committee), any member can call for and organize a new meeting or electronic vote to appoint
a new chair. Whenever there is no chair and there is a meeting, the first order of business will be to
elect a new chair.


### 6.3 Voting by the Steering Committee { #voting-by-sc }

#### 6.3.1 Majority vote

General decisions are taken by majority vote, provided that at least 75% of the members cast a vote.

#### 6.3.2 Ways of voting

Votes can be cast:

- in-person;
- in a virtual meeting;
- via electronic vote (such as by e-mail, or through an approving review in GitHub).

#### 6.3.3 Neutral votes

Members can cast a neutral vote, in which case the vote does count towards the quorum of 75%,
but is not including in calculating the majority.

Example: in a committee with 7 members, if 3 members vote in favour of a proposal,
2 vote against, and one votes neutral, the quorum is met (6 out of 7 members have voted, i.e. >75%),
and the majority (3 out of 5 non-neutral votes) is in favour, so the proposal is accepted.


#### 6.3.4 Abstaining

Members can also abstain from voting, in which case they neither count towards the quorum or calculating the majority.

Example: in a committee with 7 members, if 3 members vote in favor, 2 vote against, and one abstains from voting,
the quorum of 6 (75% of 7 members, rounded up) is not met.


#### 6.3.5 Ties

In case of a tie, the issue is discussed again, and a second vote is taken. All members that voted in the first round
need to have the opportunity to vote in the second round, which may mean that the vote needs to be postponed to
a next meeting (e.g. because one or more members voted by e-mail, and are not present at the meeting).


#### 6.3.6 Failing to reach quorum

In case the quorum of 75% is not reached, the vote is postponed until quorum can be met.


#### 6.3.7 Fully electronic vote

A fully electronic vote (i.e. *all* members vote electronically) can be organized by the chair, in order to prevent
having to delay a vote to the next meeting. Such a fully electronic vote is only valid once *all* members have cast their vote,
or have explicitly stated that they abstain from voting.


#### 6.3.8 Voting topics

Anything may be brought to a vote during the meeting. However, if known upfront, issues that need to be voted on are announced
by the chair at least one week prior to the meeting, to give members the opportunity to cast an electronic vote if they cannot attend.


#### 6.3.9 Votes on amending Charter or Governance

To amend the [Charter](charter.md), [Governance](governance.md) or [Policies](policies.md), a two-thirds majority of
*all* Steering Committee Members needs to be in favour of the amendment. This is irrespective of the number of Members
who have actually cast a vote, or are present at a meeting. Since the majority vote is determined based on the total
amount of Members (rather than the total amount of votes), there is no quorum for votes on amendments to the Charter,
Governance or Policies.

### 6.4 Meetings

The Steering Committee will meet as needed, but at least once per quarter. The chair is responsible for organizing the meeting.
Any member can request the chair to organize a meeting. Meetings are announced at least 2 weeks in advance, unless _all_ Members
have agreed that a meeting on shorter notice is required.


#### 6.4.1 Meeting notes

For every meeting of the Steering Committee, the chair ensures that meeting notes are taken and stored in a location that only Steering Committee members can access.

The notes will be made publicly available at https://docs.easybuild.io/docs/governance/steering-committee/meeting-notes,
and will provide a clear overview of discussed items, decisions made, and action points.

Prior to publication, information that is considered to be confidential, sensitive, or for another reason not appropriate for
public disclosure will be removed or redacted. The Steering Committee aims to make the meeting notes available within four weeks
after the meeting has taken place.


#### 6.4.2 Advisors

The Steering Committee may appoint *advisors* who are invited to the Steering Committee meeting or specific parts of the meeting.

Any Steering Committee member can propose an advisor to the chair, and if the chair agrees the advisor is invited to join the meeting.
If the chair wants to invite an advisor, they need to get confirmation from at least one Steering Committee member that this makes sense.
Any Steering Committee member can raise an objection to someone joining as advisor as soon as it is known who will be joining as advisor(s).

Advisors bring in specific expertise that supports the discussions and the decision making done by the Steering Committee.

They are *not* considered to be members of the Steering Committee and do therefore not hold any voting rights.

When requested by the chair, advisors shall leave the Steering Committee meeting.


## 7. Code of Conduct

The EasyBuild Code of Conduct can be found [here](code-of-conduct.md).

## 8. Review and Amendment

Changes to the governance require approval by the Steering Committee, as per the rules described the [Voting by the Steering Committee](#voting-by-sc) section.
