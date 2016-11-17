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
var ProblemListComponent = (function () {
    function ProblemListComponent(_problemService) {
        var _this = this;
        this._problemService = _problemService;
        this._problemService.getProblems().subscribe(function (data) { _this.problems = data; });
    }
    ProblemListComponent = __decorate([
        core_1.Component({
            selector: 'main-app',
            template: "<p *ngFor=\"let problem of problems\"><a [routerLink]=\"['/problems', problem.id]\">{{ problem.title }}</a></p>",
            providers: [problem_service_1.ProblemService]
        }), 
        __metadata('design:paramtypes', [problem_service_1.ProblemService])
    ], ProblemListComponent);
    return ProblemListComponent;
}());
exports.ProblemListComponent = ProblemListComponent;
//# sourceMappingURL=problemlist.component.js.map