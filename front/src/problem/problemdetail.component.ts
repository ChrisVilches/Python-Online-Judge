import { Component }      from '@angular/core';
import { ProblemService } from "../services/problem.service";
import { ActivatedRoute } from '@angular/router';

@Component({})
export class Problem{
    title : string;
    statement : string;
}

@Component({
    selector: 'main-app',
    template: `<h1>{{ problem.title }}</h1><p>{{ problem.statement }}</p>`,
    providers: [ProblemService]
})
export class ProblemDetailComponent { 
        
    private problem : Problem;
    
    
    constructor(private _problemService: ProblemService, private route: ActivatedRoute){
        this.problem = new Problem();      
        
        var id = this.route.snapshot.params['id'];
        this._problemService.getProblem(id).subscribe(data => this.problem = data.problem);
    }  
    
}