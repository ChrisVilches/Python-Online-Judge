import { NgModule }      from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppComponent }  from './app.component';
import { HttpModule }    from '@angular/http';
import { BaseUrlService} from './services/url.service'

@NgModule({
  imports: [BrowserModule, HttpModule],
  declarations: [ AppComponent ],
  bootstrap:    [ AppComponent ],
  providers: [BaseUrlService]
})
export class AppModule { }