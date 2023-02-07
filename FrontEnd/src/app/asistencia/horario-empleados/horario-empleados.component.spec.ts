import { ComponentFixture, TestBed } from '@angular/core/testing';

import { HorarioEmpleadosComponent } from './horario-empleados.component';

describe('HorarioEmpleadosComponent', () => {
  let component: HorarioEmpleadosComponent;
  let fixture: ComponentFixture<HorarioEmpleadosComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ HorarioEmpleadosComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(HorarioEmpleadosComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
