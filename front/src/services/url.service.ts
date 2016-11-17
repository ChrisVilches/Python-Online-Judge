import {Injectable} from '@angular/core';
 
@Injectable()
export class BaseUrlService {
    
    private _baseUrl:string = "http://localhost:3000/";
    
    getBaseUrl() : string{
        return this._baseUrl;
    }
}