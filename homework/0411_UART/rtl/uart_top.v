module uart_top (
    input        clk,
    input        rst,
    // RX signal
    input        uart_rx,
    output [7:0] rx_data,
    output       rx_done,
    // TX signal
    input        tx_start,
    input  [7:0] tx_data,
    output       tx_busy,
    output       tx_done,
    output       uart_tx
);
  wire w_b_tick;

  uart_rx U_UART_RX (
      .clk    (clk),
      .rst    (rst),
      .rx     (uart_rx),
      .b_tick (w_b_tick),
      .rx_data(rx_data),
      .rx_done(rx_done)
  );

  uart_tx U_UART_TX (
      .clk     (clk),
      .rst     (rst),
      .tx_start(tx_start),
      .b_tick  (w_b_tick),
      .tx_data (tx_data),
      .tx_busy (tx_busy),
      .tx_done (tx_done),
      .uart_tx (uart_tx)
  );

  baud_tick U_BAUD_TICK (
      .clk   (clk),
      .rst   (rst),
      .b_tick(w_b_tick)
  );
endmodule
