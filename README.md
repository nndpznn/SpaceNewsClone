**CMSI 2022** Mobile Application Development, Spring 2024

# Assignment 0221
It’s time to start talking…to web services! For this assignment, we’d like you to demonstrate:
* The ability to model a public API’s information as Swift `struct`s
* The ability to fetch and display data from a public API
* Knowledge of asynchronous Swift, including abstraction of networking code within asynchronous functions
* Proper progress feedback and API error handling
* Additional, deeper knowledge of effective SwiftUI app development

## Background Reading
The [official SwiftUI tutorials](https://developer.apple.com/tutorials/swiftui) continue to be of value for SwiftUI fundamentals, but it doesn’t include communication with web services. This [Hacking with Swift tutorial](https://www.hackingwithswift.com/books/ios-swiftui/cupcake-corner-introduction) walks you through a full app that _does_ have this aspect, so add this one to your library. As before, the broader [SwiftUI documentation site](https://developer.apple.com/documentation/swiftui/) should continue to provide more depth and specifics, in addition to the various help content that can be found in Xcode.

Asynchronous programming is intrinsic to anything that involves networks, so you may want to focus on [Swift resources](https://developer.apple.com/swift/resources/) on that topic. The Swift Language page on [optional types](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html#ID330) (also [this one](https://developer.apple.com/documentation/swift/optional)) as well as on [Concurrency](https://docs.swift.org/swift-book/LanguageGuide/Concurrency.html) may be of particular interest.

For a distilled version of these topics, check them out on the [Swift tour page](https://docs.swift.org/swift-book/GuidedTour/GuidedTour.html).

As we go deeper into more open-ended app design territory, the [iOS Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/ios/) will continue to serve as a valuable resource for design decisions as well as conventions and standards for iOS user interfaces.

Finally, the official [Git Book](https://git-scm.com/book/en/v2) will continue to be of use not only for collaboration on your own repository but also for interacting with others. Chapters 5 and 6 are good reading for advancing what you already know. And if you haven’t read Chapters 1–3 yet, it’s never too late to catch up.

## For Submission
You will be creating an interactive mobile app for fetching data from an API and displaying the data as you like. “List of stuff” remains on the table—live-loaded from a service now, rather than from a local JSON file—but you are no longer restricted to that. Be creative, but also work toward creating an application that would actually be useful. Match it with the particular features, information, and capabilities of the web service API of your choice. You can use any API that you find: it can be for music, food, restaurants, museums, weather, you name it.

Need some API ideas? API lists abound. Try [this one](https://mixedanalytics.com/blog/list-actually-free-open-no-auth-needed-apis/), [this one](https://apilist.fun/), [this one](https://www.postman.com/explore/apis-for-beginners) or (especially) [this one](https://github.com/public-apis/public-apis).

The [APIdex sample](https://classroom.github.com/a/j5B0VWMq) provides some ideas and code—hope you feel that APIdex feels incomplete, because it is! It is meant only to show you a range of approaches that many API-backed apps share. Your own app _must definitely have more functionality than APIdex_. Feel free to make use of any techniques learned in our class demonstrations and code-alongs.

So first and foremost, you must have a functional and sufficiently bug-free app:
* Effective and/or interesting API use—Don’t just call an API for calling’s sake; envision a potentially useful application for it
* Present the API’s data well—Avoid excessive plain text…structure, stylize, and highlight the information well
* Let your user have a say—Provide at least one use case where the API request is based on user input (e.g., search term? menu choice? settings?)

Next, your app should look great outside _and_ inside (i.e., for fellow developers):
* Abstraction of network operations—Declare all network operations as asynchronous functions, with the rest of the code calling those functions. i.e., SwiftUI views should call those functions instead of using Swift’s URL and request objects/functions directly
* Appropriate user interface feedback—The app should provide visible indicators when it is waiting for asynchronous operations to finish ([`ProgressView`](https://developer.apple.com/documentation/swiftui/progressview/) is your friend…your really really good friend!)
* Graceful error handling with messaging to user—No unexpected freezes nor stack traces please; don’t restrict error reporting to `print` statements because your users won’t see those! Imagine how you would feel if your favorite mobile app did that

As always, your app’s layout and design must demonstrate these characteristics:
* Effective layout via proper composition of stacks, spacers, padding, and other SwiftUI features
* Appealing color choices and visuals—demonstrate your mastery of views and their properties (without violating any iOS Human Interface Guidelines 😅)
* Proper choice of input views and controls—you can model what’s in APIdex but make sure to use a different API and tailor the functionality specifically to that API

As in the first assignment, certain technical specifics are required—_all_ of them, or no credit will be awarded (as one goal of this assignment is to get you to actually use a wide range of foundational SwiftUI techniques):
* Use of model objects to separate data from presentation—now matched up to your chosen API’s data!
* Live retrieval from and interaction with the API—no loading of everything once and relying on memory after
* Coded-in animations or transitions beyond the default SwiftUI view behaviors (i.e., you have to add `.animation` or other similar code to achieve the desired effect)
* Programmed graphics using paths, gradients, and related functions
* Custom app icon, duly credited

Supply a simple _about.md_ Markdown file that describes your app briefly. Include a brief description of the API that you have chosen, including a link to its documentation. Highlight anything about the app that you think is particularly interesting or that you’re particularly proud of.

## Operational Tips/Suggestions
* Although there is no particular mandated approach toward building API-backed apps, you won’t go wrong with this approach:
    * Start by studying the API. Get to know its features. _Communicate with it directly_ using the [Postman desktop app](https://www.postman.com), _curl_, or similar utilities. Talk to it until you feel that you know it well
    * Define `struct`s that correspond to the responses returned by the API. You don’t have to capture _all_ of the data provided, but what you do model has to match exactly (property names, data types, structures)
    * Build out the SwiftUI views that will display the API’s information or solicit input from the user. Use SwiftUI’s preview capability to instantiate in-memory versions of the API model objects—ideally, “transcribe” those model objects directly from actual API responses
    * With the models in place and the views ready to receive them, _now_ write the asynchronous functions that request information from the API. Don’t expect to get it right the first time—iterate until the information flows correctly from “the cloud” to your user’s screen
    * Make strategic use of `print` statements to display information on the console for debugging and troubleshooting
* Remember that there isn’t enough class time to cover absolutely everything that you might want to do! We hope that our class time so far has served to give you a good foundation for getting started, but definitely don’t let “this wasn’t mentioned in class” be a barrier when it comes to figuring things out
    * Get increasingly better at doing targeted searches on the web. Are you looking to implement a specific feature that isn’t in the APIdex nor shown in class? Look it up! Trade secret—much of APIdex was built by doing precisely that
    * Don’t hesitate to look directly at exact function signatures and type definitions in order to get a deeper understanding of the code you’re writing, especially code that you’re adapting (and crediting!) from other sources
 * Note the timing! Now that you have done the first app, you have a clearer idea of how long it takes to put something like this together. _Schedule your work accordingly._ It’s fair to say that for this app, you will take roughly the same amount of time to code up the app itself, but now you also have to factor in:
    1. The time it takes to choose and learn your API
    2. The time it takes to write correct `struct` definitions for your API’s responses
    3. The time it takes to implement network functions
    4. Additional state/logic for showing progress feedback and handling errors

    So make sure to plan accordingly! The due date may seem far away, but it’s scheduled there for a reason 🧐

### Initial setup: Unifying your GitHub and Xcode repositories
This section is copied from the first assignment’s instructions, and remains relevant if you need to merge an Xcode-created _git_ repository and the GitHub Classroom assignment repo so it is reproduced here.

> The repository for this assignment comes _only_ with this _README.md_ by design, so that you can go through the motions of creating the app project in Xcode yourself. Checking _Create Git repository on my Mac_ will set things up properly but as a _separate_ repository from the one that you get with the assignment, and it takes some specialized _git_ commands to “cross the streams” successfully 👻
>
> Note also that **if you are working in a group**, _only one of you_ needs to do this to the group assignment repository. Once it has been set up, everyone can then clone that repository and should be good to go.
>
> Depending on how much _git_ you have done, you may encounter some “wrinkles” that will feel unfamiliar. Make sure to look at the “`pull` wrinkle” subsections for instructions on how to handle them.
>
> So when setting up for the first time, instead of the usual `git clone` command, do the following:
> 1. Create your initial Xcode project on your machine with the _Create Git repository on my Mac_ option checked
> 2. Acquire the URL of your assignment repository from the green `Code` button on GitHub—let’s call this `YOUR_REMOTE_URL` (this is also what you would do before doing an initial `git clone`, but in this case we will do something different with it—read on)
> 3. Make sure that you don’t have any pending changes on your Xcode project—if so, commit them
> 4. From the command line, `cd` into your Xcode project’s folder and type the following three commands:
>
> ```
> git remote add origin YOUR_REMOTE_URL
> git pull origin main --allow-unrelated-histories
> git branch --set-upstream-to=origin/main main
> ```
>
> (don’t forget to substitute `YOUR_REMOTE_URL` above for the specific URL of your GitHub repository)
>
> That should do it! The repository created by Xcode and the assignment repository that GitHub Classroom gave you should now be “as one.” You should now be able to use _git_ on this folder as if you had `git clone`-d it normally.


Because you will have already done this at least once from the prior assignment, you should no longer see the “You have divergent branches…” message upon doing the `git pull`, but if you do, invoke `git config pull.rebase false` then attempt the `pull` again.

And remember that <kbd>:</kbd><kbd>w</kbd><kbd>q</kbd><kbd>⏎</kbd> is the key sequence that gets you out of the _vi_ auto-generated commit message display, in case that comes up.

## How to Turn it In
Commit the following to your repository:
- Complete Xcode project with all code, raw data, and assets
- _about.md_ file describing your app

## Specific Point Allocations
For this particular assignment, graded categories are as follows:

| Category | Points |
| -------- | -----: |
| Baseline functionality | 35 points total |
| • Effective and interesting use of the chosen API | 10 points|
| • Useful or entertaining presentation of data delivered by the API | 15 points |
| • Formation of API requests based on user input | 10 points |
| • More functionality than APIdex | deduction only (if not done) |
| Baseline code quality | 20 points total |
| • Asynchronous API functions | 10 points |
| • Feedback for operations-in-progress | 5 points |
| • Error handling and messaging | 5 points |
| Baseline design/layout | 20 points total |
| • Layout and composition | 8 points |
| • Colors and other visuals | 4 points |
| • Proper choice of input views and controls | 8 points |
| Implementation specifications | 15 points—all or nothing |
| • Model objects<br/>• API requests throughout the life of the app<br/>• Coded-in animations or transitions<br/>• Programmed graphics<br/>• Custom app icon | |
| Credits where appropriate | deduction only (if not done) |
| App description in _about.md_ | 10 points total |
| • About the app | 5 points |
| • About the API | 3 points |
| • Link to API documentation | 2 points |
| Hard-to-maintain or error-prone code | deduction only |
| Hard-to-read code | deduction only |
| Version control | deduction only |
| Punctuality | deduction only |
| **Total** | **100** |

Note that inability to compile and run any code to begin with will negatively affect other criteria, because if we can’t run your code, we can’t evaluate related remaining items completely.
