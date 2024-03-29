# Trakki

A little helper for my own plain text time tracking format.

## Status of this project

Currently everything is TODO (although the rest of this document is written as though something was present).

### Why Elixir?

Because I want to learn it and its tool chain. It's not even the best language 
for the job.

## Basic interaction

Aside from some auxiliary functions Trakki only supports to basic interactions:

  * starting a slot. Trakki will only note the time. If there is a currently
    running slot, Trakki will stop it first (including the user interaction
    described bellow).
  * stopping a slot. Trakki will prompt you for what you did since starting the
    slot.

The only other commands will include normalization or formatting. No reporting 
functionality is planned (just open the file in an editor for that...)

## File format

Everything inside a tracking file is assumed to be in chronological order.

A day is started by a line in the following format:

`== YY/MM/DD WD ==  hh:mm` where `WD` marks the week day (optional) and the 
time between the marks the sum of tracked hours that day (also
optional). Only the leading equal signs are mandatory. But usually the trailing equal signs are extended to column 72 (effectively push the duration into column 75).

Every day can have multiple tracking entries in the following format:

`hh:mm-hh:mm description            [hh:mm]` where first two times mark the 
start and end of the slot, followed by a description of what was done in that slot. The line ends with an (optional) duration of this slot in square brackets (usually ending on column 80. 

If the last slot of the current (or previous) day only consist of the start time (thus looking like this: `hh:mm-`) it is considered to be the current slot. Other such entries on other days are ignored but might emit warnings.

The times at the beginning and the duration at the end of each slot line effectively leaves 60 characters (columns 13-72) for the description. Longer descriptions can be spread over consecutive lines but should also stay within these columns. The times and the duration always stay on the first line.

If a description starts with two starts `**` the slot is considered to be not traceable (like supper breaks). The duration is in normal brackets instead curly brackets and is not added to the daily sum of durations.

Subsequent slots (end- and start-times match exactly) should not have an empty line between them while slots with dead time in between should.

Slots that overlap should be separated by a single line starting with at least 3 exclamation marks

If the end time of a slot is before its start time, the slot is considered to 
span over midnight (as of writing all the time is added to the track duration
of the day the slot started on).

All elements described as optional (weekdays and durations) can be entered
manually but can and will be changed when issuing the normalisation command.
The rules concerning columns for description and lines between slots can be enforced by the formatting command.

### Example

```
== 19/08/08 Thu ========================================================  02:40
08:00-09:00 thinking about stuff                                         [01:00]
09:00-17:00 ** just worked. Nothing important                            (08:00)

23:10-00:50 editing the README                                           [01:40]

== 19/08/09 Fri ========================================================  06:25
06:00-06:10 waking up feeling fine                                       [00:10]
!!!
06:05-06:20 actually got woken by the kids. My timetracking got all      [00:15]
            mixed up.

07:00-08:00 got the kids dressed and made breakfast                      [01:00]
08:00-11:00 did so many things . . . I can't even remember what I did. I [03:00]
            got the kids to the kindergarden. Except it's summer and 
            there is no kindergarden. So I am not sure WHAT I did. But
            it was soooooooo much.
11:00-12:30 made lunch. Fed the kids.                                    [01:30]
12:30-13:00 took a nap                                                   [00:30]

== 19/08/10 Sat ========================================================  00:20
10:00-10:20 got packed for the swimming lake                             [00:20]
10:20-
```

## Commands

### starting

TODO

### stopping

TODO

### formatting

TODO

## Config

TODO

