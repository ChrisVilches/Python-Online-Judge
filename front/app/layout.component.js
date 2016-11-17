"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
var core_1 = require('@angular/core');
var LayoutComponent = (function () {
    function LayoutComponent() {
        open("Fuckcontent: any");
        console.log("HOLA");
    }
    LayoutComponent = __decorate([
        core_1.Component({
            selector: 'main-app',
            template: "\n\n    <h1>Python Online Judge</h1>\n    \n    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eu <code>scelerisque</code> mi, sed condimentum sapien. Quisque ac nisl semper, rutrum ligula a, sodales ipsum. Pellentesque aliquam, libero vel laoreet hendrerit, erat orci pellentesque odio, quis semper ex eros vel eros. Vestibulum vulputate purus eu magna efficitur, iaculis pretium massa pretium. Integer sit amet neque et velit malesuada laoreet ac eu ante. Maecenas a dui nibh. Duis ultricies libero mi, sit amet vestibulum velit pretium nec. Nulla facilisi. Ut nec euismod nisi. Suspendisse interdum sit amet erat in laoreet. Cras dignissim non risus molestie efficitur. Donec porta sapien a justo pharetra, non vestibulum dolor finibus. Quisque ut nisl et augue volutpat auctor. Nulla facilisi. Proin sit amet mi tortor. Suspendisse vel quam placerat, venenatis lacus in, bibendum justo.\n    </p>\n    <div>\n    <a class=\"btn btn-default page-scroll\">Login</a>\n    </div>\n    \n    <a [routerLink]='[\"/\"]'>Pagina principal</a>\n    <a [routerLink]='[\"/problems\"]'>Ver problemas</a>\n\n    \n    <router-outlet></router-outlet>\n    \n    \n    \n    "
        }), 
        __metadata('design:paramtypes', [])
    ], LayoutComponent);
    return LayoutComponent;
}());
exports.LayoutComponent = LayoutComponent;
//# sourceMappingURL=layout.component.js.map