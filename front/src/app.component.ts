import { Component } from '@angular/core';
import {ProblemService} from "./services/problem.service";

@Component({
    selector: 'main-app',
    template: `<p *ngFor="let problem of problems">{{ problem.title }}</p>`,
    providers: [ProblemService]
})
export class AppComponent { 
    
    private problems;
    
    constructor(private _problemService: ProblemService){
        this._printProblems();
    }
    
    
    private _printProblems(){
        this._problemService.getProblems().subscribe(
            data => {console.log(data); this.problems = data;},
            error => console.log("SE PILLO UN ERROR: " + error),
            () => console.log("Esto se ejecuta siempre."));
    }
    
    
}