import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AsistenciaComponent } from './asistencia/asistencia.component';

const routes: Routes = [
{path:'',redirectTo:'inicio',pathMatch:'full'},
{path:'inicio',component:AsistenciaComponent},
{path: 'inicio', loadChildren: () => import('./asistencia/asistencia.module').then(m => m.AsistenciaModule)},
{path:'**',redirectTo:'inicio',pathMatch:'full'},];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
