import { Routes } from '@angular/router';
import { UserComponent } from './components/user/user.component';
import { TaskComponent } from './components/tasks/tasks.component';
import { UserFormComponent } from './components/user-form/user-form.component';

export const routes: Routes = [
    {
        path: '',
        pathMatch: 'full',
        redirectTo: '/users/page/0'
    },
    {
        path: 'users',
        component: UserComponent,
    },

       {
        path: 'tasks',
        component: TaskComponent,
    },
    {
        path: 'users/page/:page',
        component: UserComponent,
    },
    {
        path: 'users/create', 
        component: UserFormComponent,
    },
    {
        path: 'users/edit/:id',
        component: UserFormComponent
    }

];
