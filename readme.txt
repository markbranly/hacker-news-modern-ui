# Hacker News Modern UI

Hacker News is a fantastic resource with a notoriously dated design. The internet is filled with [redesign concepts](https://whatpixel.com/hacker-news-redesigns/) and [alternative UIs](https://blog.luke.lol/tech/hacker-news-alternatives/). 

_So why another one?_
Many of those projects have different goals from this one. Some have usability issues, some have accessibility issues, some are full clients, and some are purely academic explorations.  

The purpose of this project is to produce a _working_ redesign of the Hacker News site that can be deployed as a [User Style](https://userstyles.world/). 

There are six stated goals—four design-related and two technical: 

1. Make the design more modern.
2. Make the design more usable.
3. Make the design more accessible.
4. Adhere to Y Combinator's brand standards.
5. Implement the design using _only_ **modern** Pure CSS.
6. Implement the design using _only_ resources available on ycombinator.com or deployable via CSS. 

## Notes

### Usability
Hacker News current design presents many usability issues and readability challenges. 

1. UI links lack distinction and run together.
1. Links in content are not very scannable. 
1. Font sizes are very small.
1. Reading widths are far too long to be comfortable.


### Accessibility
While there are a great many improvements we can make to the accessibility of Hacker News, there are many issues that cannot be resolved with CSS alone. 

For example, actions like expanding or collapsing a comment thread are implemented as links with javascript actions instead of buttons. CSS cannot change the markup or add keypress handlers to make the links behave like buttons.

So while this project will yield a _more_ accessible Hacker News, it will not produce a _totally_ accessible Hacker News. 


### Brand Standards
At this time, no published brand standards appear to be available. They will have to be inferred. 

The brand standards appear to be deployed inconsistently. Note the two different, analogous, blue tones displayed on this blog post:
https://www.ycombinator.com/blog/early-interviews-summer-2024
  
Considering that, 
1. The blue tone appearing copy of the post is a nearly-perfect complement of the orange, (hence a complementary scheme) and
2. The blue tone appearing as the author of the post and in the sidebar is the [default Tailwind blue](https://v2.tailwindcss.com/docs/customizing-colors),

This project will assume the former is the canonical blue for the brand. 

Y Combinators brand standards, as deployed, are not particularly accessible. This project will make use of [tints and shades of the color palette](https://maketintsandshades.com/#f26522,268bd2,d87606,374151,777777) to achieve acceptable contrast ratios where necessary. However, as much as possible, the design will adhere to the vibrant, airy, and clean feeling of the brand. 


### Modern Pure CSS
Due to the fact that the audience for this project is the cross-section of Hacker News readers and UserStyles users, we can be fairly certain that anyone using it is on an up-to-date browser. That means that almost all cutting-edge CSS is on the table. This project will attempt to make maximize that very-rare opportunity to explore the future of CSS.  


## Build
Since the end result is a single CSS file, and the source files are modern Pure CSS, the build process for this project is dead-simple; we simply have to concatenate all of the source files into one. 

A text file, `manifest.txt`, provides the ordered list of source files and a simple Makefile provides the build command:

```
$ make
```

An _experimental_ **watch** command is available as well:

```
$ make watch
```

This command utilizes the cross-platform file-monitoring utility, [fswatch](https://github.com/emcrisostomo/fswatch). At the moment, it can be a little finnicky to exit as you have to press Control-C twice in quick succession to exit; once to exit the `fswatch` command and again to exit the loop before `fswatch` is run again. 
