import { Component } from '@angular/core';

@Component({
    selector: 'main-app',
    template: `

    <h1>Python Online Judge</h1>
    
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eu <code>scelerisque</code> mi, sed condimentum sapien. Quisque ac nisl semper, rutrum ligula a, sodales ipsum. Pellentesque aliquam, libero vel laoreet hendrerit, erat orci pellentesque odio, quis semper ex eros vel eros. Vestibulum vulputate purus eu magna efficitur, iaculis pretium massa pretium. Integer sit amet neque et velit malesuada laoreet ac eu ante. Maecenas a dui nibh. Duis ultricies libero mi, sit amet vestibulum velit pretium nec. Nulla facilisi. Ut nec euismod nisi. Suspendisse interdum sit amet erat in laoreet. Cras dignissim non risus molestie efficitur. Donec porta sapien a justo pharetra, non vestibulum dolor finibus. Quisque ut nisl et augue volutpat auctor. Nulla facilisi. Proin sit amet mi tortor. Suspendisse vel quam placerat, venenatis lacus in, bibendum justo.
    </p>
    <div>
    <a class="btn btn-default page-scroll">Login</a>
    </div>
    
    <a [routerLink]='["/"]'>Pagina principal</a>
    <a [routerLink]='["/problems"]'>Ver problemas</a>

    
    <router-outlet></router-outlet>
    
    
    
    `
})
export class LayoutComponent {   
    
    constructor(){
        open("Fuckcontent: any");
        console.log("HOLA");
    }    
   
}
