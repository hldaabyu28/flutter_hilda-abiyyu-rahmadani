# Summary

##### 1. state management bloc digunakan untuk memisahkan antar busines logic dengan ui cara kerja bloc menerima event sebagai input , dianalisa dan dikelola didalam bloc , menghasilkan state sebagai ouput

##### 2. Deklarative UI 
##### - flutter memiliki sifat declarative yang artinya membangun Ui dengan screen untuk mencerminkan keadaan state saat ini 

##### - state adalah ketika sebuah widget sedang aktif dan widget tersebut menyimpan data di memori jenis state di flutter 2 ephermal state dan app state

##### - ephermal digunakan tidak ada bagian lain oada widget tree tidak perlu state management yang kompleks , hanya perlu membutuhkan statefulWidget dengan menggunakan setState()

##### - appState digunkan ketika bagian yang lain suatu aplikasi membutuhkan akses ke data widget 


##### 3. penggunaan bloc 

```dart
//import packagae bloc kedalam dependencies

dependencies:
  flutter_bloc: ^8.1.5

// buat folder bloc beserta nama file bloc,event,state

// event.dart
enum CounterEvent { increment, decrement }

// state.dart

enum CounterState { initial, loading, success, failure }

// bloc.dart
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  @override
  CounterState get initialState => CounterState.initial;

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.increment:
        yield CounterState.loading; // Show loading state
        // Perform logic to increment counter (replace with actual logic)
        await Future.delayed(const Duration(seconds: 1));
        yield CounterState.success(count + 1); // Update state with new count
        break;
      case CounterEvent.decrement:
        // Similar logic for decrement
        break;
    }
  }
}

// homepage.dart
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Counter App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainCenter,
            children: [
              BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
                  if (state is CounterState.initial) {
                    return Text('Initial count: 0');
                  } else if (state is CounterState.loading) {
                    return CircularProgressIndicator();
                  } else if (state is CounterState.success) {
                    return Text('Count: ${state.count}');
                  } else {
                    return Text('Error!');
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainSpaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => context.read<CounterBloc>().add(CounterEvent.increment),
                    child: Icon(Icons.add),
                  ),
                  ElevatedButton(
                    onPressed: () => context.read<CounterBloc>().add(CounterEvent.decrement),
                    child: Icon(Icons.remove),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

refrensi gemini
```