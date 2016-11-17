import { Component } from '@angular/core';
import {ProblemService} from "../services/problem.service";

@Component({
    selector: 'main-app',
    template: `<p *ngFor="let problem of problems"><a [routerLink]="['/problems', problem.id]">{{ problem.title }}</a></p>`,
    providers: [ProblemService]
})
export class ProblemListComponent { 
    
    private problems;
    
    constructor(private _problemService: ProblemService){
        this._problemService.getProblems().subscribe(data => { this.problems = data; });
    }  
    
}