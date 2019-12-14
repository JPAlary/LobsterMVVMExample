<h1>Lobster app (MVVM Example)</h1>

<p>
This repository contains an iOS application which display feed from <a href="https://lobste.rs/">Lobster</a>. 
For now, there is only one page which is the articles list of the Lobster's homepage. This project is not finished and will be updated with more features and tech improvements (see the <a href="#roadmap">Roadmap</a>).
</p>

<p align="center">
    <img src="https://github.com/JPAlary/LobsterMVVMExample/blob/master/Asset/homepage.png" alt="Lobster homepage" width="375" height="667" />
</p>

<o>
As it's open source, I encourage anyone to contribute or give his/her opinion :)
</p>

<h1>Purpose</h1>

<p>There is a lot of MVVM's examples on the internet, but some of them:</p>

<ul>
    <li>won't scale for heavy production project,</li>
    <li> does not fully respect the pattern.</li>
</ul>

<p>
So, the main motivation was to provide another way of applying MVVM pattern in iOS and respect the principles listed below:
</p>

<ul>
    <li>
        [x] unidirectional data flow: the action comes from the view and the result comes back to the view
    </li>
    <li>
        [x] from view model to each model layer, each component should respect <a href="https://en.wikipedia.org/wiki/Single_responsibility_principle">SRP</a> for scalability, maintainability and readability
    </li>
    <li>
        [x] clarity between architecture's layer (roles of each layer and components)
    </li>
    <li>
        [x] if the scene is heavy in term of interaction and feature, the view model layer should not become massive. It should scale for any kind of feature
    </li>
    <li>
        [x] each scene should be easily testable
    </li>
</ul>

<p>The second motivation is to provide an iOS real world example of how to do:</p>

<ul>
    <li> [x] MVVM</li>
    <li> [ ] Dependency injection</li>
    <li> [x] Unit test</li>
    <li> [x] Use Rx</li>
    <li> [ ] Navigation</li>
</ul>

<h1>Architecture</h1>

<h2>MVVM</h2>

<p>
    This application uses <a href="https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93viewmodel">MVVM</a> pattern.
</p>

<p align="center">
    <img src="https://github.com/JPAlary/LobsterMVVMExample/blob/master/Asset/MVVM.png" alt="MVVM schema" align="middle" />
</p>

<p>
    The communication between the view and view model layers is done with <a href="https://github.com/ReactiveX/RxSwift">RxSwift</a>.
</p>

<h2>MVVM - Splitted Model layer</h2>

<p>
    To be able to scale and respect <a href="https://en.wikipedia.org/wiki/Single_responsibility_principle">SRP</a>, the Model layer is decoupled into:
</p>

<ul>
    <li>
        Network module: abstract layer for network communication. For now, there is only one implementation which use `URLSession`
    </li>
    <li>
        <a href="https://docs.microsoft.com/en-us/dotnet/architecture/microservices/microservice-ddd-cqrs-patterns/infrastructure-persistence-layer-design">Repository</a> abstract layer for data access logic.
        <i>N.B: Because the repository layer is an abstract component, data can be retrieved from different source. Currently, repositories use the Network component, to fetch data from an API. But, cache or locale data fetching can be implemented and if we need to mix different strategies, there is a good pattern known as <a href="https://en.wikipedia.org/wiki/Decorator_pattern">Decorator</a> to nicely handle it without breaking <a href="https://en.wikipedia.org/wiki/Single_responsibility_principle">SRP</a> and unit tests. In future development, I'll try to add this to show a concrete example.</i>
    </li>
    <li>
        Interactor layer which holds business logic and acts as the "glue" between view model and models. This pattern extends from <a href="https://en.wikipedia.org/wiki/Command_pattern">Command</a> pattern and usually used in <a href="https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html">Clean Architecture</a> in the use case onion section.
        <i>N.B: Because the interactor is an abstract component, view model does not know the implementation execution. Therefore, there is an implementation `ChainInteractor` which holds an array of `Interactor`. It can be useful when we want to decouple multiple logic of one scene into one interactor (from the view model point of view). Then, one interactor equals one logic business for one action.</i>
    </li>
</ul>

<p align="center">
    <img src="https://github.com/JPAlary/LobsterMVVMExample/blob/master/Asset/MVVM-I.png" alt="MVVM-I schema" align="middle" />
</p>

<h1>Roadmap</h1>

<ul>
    <li>[ ] Dependency Injection with <a href="https://github.com/hmlongco/Resolver">Resolver</a></li>
    <li>[ ] Navigation (Coordinator or Router)</li>
    <li>[ ] Show article details</li>
    <li>[ ] Onboarding workflow and logic demonstration</li>
    <li>[ ] Application configuration</li>
    <li>[ ] Add caching strategy to avoid api request spamming</li>
</ul>
