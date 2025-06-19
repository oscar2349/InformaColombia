import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { UserAppComponent } from './components/user-app.component';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, UserAppComponent,FormsModule],
  templateUrl: './app.component.html'
})
export class AppComponent {
  title = 'user-app';
}
