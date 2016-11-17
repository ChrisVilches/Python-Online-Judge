import { NgModule }      from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpModule }    from '@angular/http';
import { BaseUrlService} from './services/url.service'
import { RouterModule, Routes } from '@angular/router';
import { FormsModule }          from '@angular/forms';

// Vistas

import { LayoutComponent }     from './layout.component';
import { HomePageComponent }      from './mainpages/home.component';
import { ErrorPageComponent }     from './mainpages/error.component';
import { ProblemListComponent }   from './problem/problemlist.component';
import { ProblemDetailComponent } from './problem/problemdetail.component';



const appRoutes: Routes = [
  { path: 'problems/:id', component: ProblemDetailComponent },
  { path: 'problems', component: ProblemListComponent, data: { title: 'Explorar problemas' }},
  { path: '', component: HomePageComponent },
  { path: '**', component: ErrorPageComponent }
];




@NgModule({
  imports: [
      BrowserModule, 
      HttpModule,
      FormsModule,
      RouterModule.forRoot(appRoutes)
  ],
  declarations: [ 
      LayoutComponent,
      HomePageComponent,
      ProblemDetailComponent,
      ProblemListComponent,
      ErrorPageComponent
  ],
  bootstrap: [LayoutComponent],
  providers: [BaseUrlService]
})
export class AppModule { }
