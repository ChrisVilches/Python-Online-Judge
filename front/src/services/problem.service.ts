import {Injectable} from '@angular/core';
import {BaseUrlService} from './url.service';
import {Http, Response} from '@angular/http';
import 'rxjs/add/operator/map'

@Injectable()
export class ProblemService {
    
    constructor(private _http: Http, private _baseUrlService: BaseUrlService){ }
        
    getProblems(){
        return this._http.get(this._baseUrlService.getBaseUrl() + "/problems").map(res => res.json());
    }
    
    getProblem(id : number){
        return this._http.get(this._baseUrlService.getBaseUrl() + "/problems/" + id).map(res => res.json());
    }
}
