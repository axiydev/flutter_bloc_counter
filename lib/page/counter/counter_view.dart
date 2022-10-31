import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_counter/page/counter/bloc/counter_bloc.dart';

class CounterView extends StatelessWidget {
  CounterView({super.key});
  final bloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    log('BUILD');
    // final bloc = BlocProvider.of<CounterBloc>(context, listen: true);
    return Scaffold(
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
            bloc: bloc,
            builder: (context, state) {
              if (state is CounterLoadingState) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              }
              if (state is CounterSuccessState) {
                return ListTile(
                  title: Text(
                    state.count.toString(),
                    style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue),
                  ),
                  subtitle: Text(
                    state.message.toString(),
                    style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue),
                  ),
                );
              }
              // if (state is InitialConterState) {
              //   return Text(
              //     bloc.count.toString(),
              //     style: const TextStyle(
              //         fontSize: 40,
              //         fontWeight: FontWeight.w600,
              //         color: Colors.blue),
              //   );
              // }
              if (state is InitialConterState) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              }
              return const Text('Your app has an error');
            }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: '1',
            onPressed: () {
              bloc.add(OnIncrementPressedEvent());
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            width: 20,
          ),
          FloatingActionButton(
            heroTag: '2',
            onPressed: () {
              bloc.add(OnDecrementPressedEvent());
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
