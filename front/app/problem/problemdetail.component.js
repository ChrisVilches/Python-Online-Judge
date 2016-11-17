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
var problem_service_1 = require("../services/problem.service");
var router_1 = require('@angular/router');
var Problem = (function () {
    function Problem() {
    }
    Problem = __decorate([
        core_1.Component({}), 
        __metadata('design:paramtypes', [])
    ], Problem);
    return Problem;
}());
exports.Problem = Problem;
var ProblemDetailComponent = (function () {
    function ProblemDetailComponent(_problemService, route) {
        var _this = this;
        this._problemService = _problemService;
        this.route = route;
        this.problem = new Problem();
        var id = this.route.snapshot.params['id'];
        this._problemService.getProblem(id).subscribe(function (data) { return _this.problem = data.problem; });
    }
    ProblemDetailComponent = __decorate([
        core_1.Component({
            selector: 'main-app',
            template: "<h1>{{ problem.title }}</h1><p>{{ problem.statement }}</p>",
            providers: [problem_service_1.ProblemService]
        }), 
        __metadata('design:paramtypes', [problem_service_1.ProblemService, router_1.ActivatedRoute])
    ], ProblemDetailComponent);
    return ProblemDetailComponent;
}());
exports.ProblemDetailComponent = ProblemDetailComponent;
//# sourceMappingURL=problemdetail.component.js.map